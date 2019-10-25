resource "ibm_service_instance" "service_instance" {
  name       = "nibz-tf-test"
  space_guid = "${data.ibm_space.spacedata.id}"
  service    = "speech_to_text"
  plan       = "standard"
  tags       = ["cluster-service", "cluster-bind"]
}
