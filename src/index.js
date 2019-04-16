import API from "@flourish/live-api";
import API_KEY from "./lib/api-key";


function createHistogram(selector, arr) {
	var data = { data: arr.map(function(d) { return { data: d }; }) };

	var state = {
		show_rug_plot: false,
		x_title: "Value",
		y_title: "Count"
	};


	var opts = {
		template: "@tim/histogram",
		version: "1",
		container: selector,
		api_key: API_KEY,

		column_names: {
			data: {
				data: "Value",
			}
		},

		data: data,
		state: state
	};


	var flourish_api = new API(opts);


	var updateGraphic = function(val) {
		state.bin_count = val;
		flourish_api.update(state, data);
	}

	updateGraphic();

	return updateGraphic
}


export default createHistogram;