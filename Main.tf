provider "vsphere" {
	user			= "${var.username}"
	password		= "${var.password}"
	vsphere_server		= "${var.vcenter}"
	allow_unverified_ssl 	= true
}


data "vsphere_datacenter" "dc" {
  name = "RSI:L-UK"
}


data "vsphere_virtual_machine" "template" {
  name          = "Folder-Template"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


data "vsphere_datastore" "datastore" {
  name          = "902821-RSI:L-FC-LUN0"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "HPH5-A-2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "HPH5-A-2/Resources"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "3130751-DEV-VLAN160"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network1" {
  name          = "3130751-STG-VLAN170"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "clone01" {
  name             = "rFolder01"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 1024
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "rFolder01"
    size  = 40
  }

 clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    timeout = 240
  }
}

resource "vsphere_virtual_machine" "clone02" {
  name             = "rFolder02"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 1024
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "rFolder02"
    size  = 40
  }

 clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    timeout = 240
  }
}

resource "vsphere_virtual_machine" "clone03" {
  name             = "rFolder03"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 1024
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "rFolder03"
    size  = 40
  }

 clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    timeout = 240
  }
}

resource "vsphere_virtual_machine" "clone04" {
  name             = "rFolder04"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 1024
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  network_interface {
    network_id = "${data.vsphere_network.network1.id}"
  }

  disk {
    label = "rFolder04"
    size  = 40
  }

 clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    timeout = 240
  }
}

resource "vsphere_virtual_machine" "clone05" {
  name             = "rFolder05"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 1024
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  network_interface {
    network_id = "${data.vsphere_network.network1.id}"
  }

  disk {
    label = "rFolder05"
    size  = 40
  }

 clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    timeout = 240
  }
}

