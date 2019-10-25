# export TF_VAR_ibmcloud_api_key="$VALUE"
# export TF_VAR_iaas_classic_username="$VALUE"
# export TF_VAR_iaas_classic_api_key="$VALUE"

provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"
  iaas_classic_username = "${var.iaas_classic_username}"
  iaas_classic_api_key  = "${var.iaas_classic_api_key}"
}
variable ibmcloud_api_key {}
variable iaas_classic_username {}
variable iaas_classic_api_key {}
data "ibm_space" "spacedata" {
  space = "dev"   # this will be different if you aren't is this space
  org   = "Developer Advocacy" # this will be different if you aren't is this org
}

