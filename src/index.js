import API from "@flourish/live-api";
import API_KEY from "./lib/api-key";
import { flourishifyObjects } from "@flourish/transform-data";

var selector, data, shape;

function getOpts() {
	var dot_shape = "polygon";
	if (shape === "circle") dot_shape = "circle";
	else if (shape === "square") dot_shape = "square";

	var dot_sides = 3;
	if (shape === "hexagon") dot_sides = 6;

	var state = {
		popup: "<h2>Tailnum: {{Tailnum}}</h2>\n<p></p>",
		dot_shape: dot_shape,
		dot_sides: dot_sides
	};

	var columns_bindings = {
		categorical: ["Type", "Manufacturer", "Model", "Engine"],
		continuous: ["Engines", "Seats"],
		metadata: ["Tailnum"]
	};


	var questions = flourishifyObjects(data, {}, columns_bindings);

	var opts = {
		template: "@flourish/survey",
		version: "4.2.0",
		container: selector,
		api_key: API_KEY,

		column_names: { questions: questions.column_names },

		data: { questions: questions, order: [], labels: [], colors: [], places: [], answer_groups: [] },
		state: state
	};

	return opts;
}

function createSurvey(_selector, _data, _shape) {
	selector = _selector;
	data = _data;
	shape = _shape;

	var flourish_api = new API(getOpts());


	var updateGraphic = function(d, s) {
		data = d;
		shape = s;
		flourish_api.update(getOpts());
	};

	return updateGraphic;
}


export default createSurvey;
