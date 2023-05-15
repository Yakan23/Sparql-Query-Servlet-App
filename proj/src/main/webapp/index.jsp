<!DOCTYPE html>
<html>
<head>
	<title>Sparql Query</title>
	<script src="./RequestHandler.js"></script>
    	<style>
		.container {
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			height: 100vh;
		}
		.textbox {
			width: 600px;
			height: 450px;
			margin-bottom: 10px;
			padding: 10px;
			border-radius: 5px;
			border: 1px solid #ccc;
			font-size: 16px;
            overflow: auto;
		}
		.button {
			background-color: #4CAF50;
			border: none;
			color: white;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			border-radius: 5px;
			cursor: pointer;
		}
		.label {
			font-size: 14px;
			color: #333;
			margin-top: 5px;
		}
	</style>
</head>
<body>
	<h1>Sparql Query</h1>
	<form id="test" class="container">
		<label for="query">Enter Sparql Query:</label>
		<textarea type="text" id="query" name="query" class="textbox"></textarea>
		<button type="button" class="button" onclick="executeQuery()">Execute</button>
	</form>

</body>
</html>


