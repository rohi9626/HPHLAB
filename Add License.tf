resource "vsphere_license" "licenseKey" {
	license_key = "00000-00000-00000-00000-00000"
  
	labels {
	  VpxClientLicenseLabel = "Licensed"
	  Workflow = "Licensed"
	}
  
  }
  