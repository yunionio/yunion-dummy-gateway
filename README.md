用于为All-in-One部署中的子网提供网关支持，使虚拟子网中的节点能够与外界通信

配置文件，`/etc/yunion/dummy-gatway/<network-name>`

| 变量名  | 默认值 | 备注 |
| ------- | ------ | ---- |
| `OVS_BRIDGE`  | `br0`  |  节点所在网桥名称  |
| `BOND`  | `bond-gw`  |  新建的bond设备名称。sdnagent会清理`br0`中未纳管的tun, veth设备，因此这里使用bond  |
| `VETH`  | `veth-gw`  |  新建的veth设备前缀。`veth-gwa`将是网关，`veth-gwb`将作为`bond-gw`的从设备存在  |
| `VLAN`  | `2`  |  虚拟子网所属的VLAN；留空表示不使用VLAN标签  |
| `NETWOKR`  | `10.0.2.0/24`  |  虚拟子网的掩码 |
| `GATEWAY`  | `10.0.2.1/24`  |  虚拟子网的网关地址。该地址将被添加到`veth-gwa`上 |

为`<network-name>`应用配置

	sudo systemctl enable --now yunion-dummy-gateway@<network-name>

在`/etc/yunion/host.conf`中启用`allow_switch_vms`

	allow_switch_vms = True

应用

	systemctl restart yunion-host-sdnagent

测试效果

 - 从`veth-gwa`所在机器上能够与虚拟子网中节点通信
 - 从虚拟子网中节点能够与外界通过NAT通信
