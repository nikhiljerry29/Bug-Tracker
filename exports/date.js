module.exports = function (currentDate) {

	const today = new Date(currentDate);

	const options = {
		year: 'numeric',
		day: "numeric",
		month: "short"
	};

	return today.toLocaleDateString("en-US", options);

}