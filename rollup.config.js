import node_resolve from "rollup-plugin-node-resolve";
import json from "rollup-plugin-json";

export default {
	input: "src/index.js",
	output: {
		file: "www/survey.js",
		name: "createSurvey",
		format: "iife",
	},
	plugins: [
		node_resolve(),
		json()
	]
};
