import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

console.log("address_autocomplete_controller loaded")

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    console.log("connected!")
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event =>this.setInputValue(event))
    this.geocoder.on("clear", () =>this.clearInputValue())
  }


  setInputValue(event){
    console.log(event) // check where's the address(place_name) from the console response
    this.addressTarget.value = event.result["place_name"]
  }

  clearInputValue(){
    this.addressTarget.value = ""
  }

  disconnect() {
    this.geocoder.onRemove()
  }
}
