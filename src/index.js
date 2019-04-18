import API from "@flourish/live-api";
import API_KEY from "./lib/api-key";
import { flourishifyObjects } from "@flourish/transform-data";

var selector;

function getOpts(input) {
	var state = {
		popup: "<h2>Tailnum: {{Tailnum}}</h2>\n<p></p>"
	};

	var columns_bindings = {
		categorical: ["Type", "Manufacturer", "Model", "Engine"],
		continuous: ["Engines", "Seats"],
		metadata: ["Tailnum"]
	};


	var data = flourishifyObjects(input, {}, columns_bindings);

	var opts = {
		template: "@flourish/survey",
		version: "4.2.0",
		container: selector,
		api_key: API_KEY,

		column_names: { questions: data.column_names },

		data: { questions: data, order: [], labels: [], colors: [], places: [], answer_groups: [] },
		state: state
	};

	return opts;
}


function createSurvey(_selector, arr) {
	selector = _selector;

	var flourish_api = new API(getOpts(arr));


	var updateGraphic = function(d) {
		flourish_api.update(getOpts(d));
	};

	// updateGraphic();

	return updateGraphic;
}


export default createSurvey;
