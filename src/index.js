import API from "@flourish/live-api";
import API_KEY from "./lib/api-key";

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

	var opts = {
		template: "@flourish/survey",
		version: "4.2.0",
		container: selector,
		api_key: API_KEY,

		bindings: {
			questions: {
				categorical: ["Type", "Manufacturer", "Model", "Engine"],
				continuous: ["Engines", "Seats"],
				metadata: ["Tailnum"]
			}
		},

		data: { questions: data, order: [], labels: [], colors: [], places: [], answer_groups: [] },
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
