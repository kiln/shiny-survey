import API from "@flourish/live-api";
import API_KEY from "./lib/api-key";
import { flourishifyObjects } from "@flourish/transform-data";


function createSurvey(selector, arr) {
	var columns_bindings = {
		categorical: ["Year", "Type", "Manufacturer", "Model", "Engine"],
		continuous: ["Engines", "Seats"],
		metadata: ["Tailnum"]
	};

	var data = flourishifyObjects(arr, {}, columns_bindings);

	var state = {
		popup: "<h2>Tailnum: {{Tailnum}}</h2>\n<p>Hi</p>"
	};


	var opts = {
		template: "@flourish/survey",
		version: "4.2.0",
		container: selector,
		api_key: API_KEY,

		column_names: { questions: data.column_names	},

		data: { questions: data, order: [], labels: [], colors: [], places: [], answer_groups: [] },
		state: state
	};


	var flourish_api = new API(opts);


	var updateGraphic = function() {
		flourish_api.update(state, data);
	};

	updateGraphic();

	return updateGraphic;
}


export default createSurvey;
