import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["items", "form"]
connect() {
  console.log(this.itemsTarget)
}

}
