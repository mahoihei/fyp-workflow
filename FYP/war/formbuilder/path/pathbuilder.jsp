<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var formID = "${param.formID}";
	var version = "${param.version}";
</script>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/jquery.ui.position.js"></script>
<script type="text/javascript" src="./js/jquery.contextMenu.js"></script>
<script type="text/javascript" src="./js/jquery.lightbox_me.js"></script>
<script type="text/javascript" src="./js/select2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/prototype.js"></script>
<script type="text/javascript" src="./js/property.js"></script>
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.css">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" type="text/css"
	href="./css/jquery.contextMenu.css">
<link rel="stylesheet" type="text/css" href="./css/select2.css">
<link rel="stylesheet" type="text/css" href="./css/pathbuilder2.css">
<script src="js/jquery.jsPlumb-1.3.16-all-min.js"></script>
<script src="js/pathbuilder.js"></script>
</head>

<body>
	<div id="main-container">
		<button id="save-btn">Save</button>
		<div id="content-wrapper">
			<div id="path-canvas-wrapper">
				<div id="path-canvas"></div>
			</div>
		</div>
		<div id="right-wrapper">

			<div id="select-node">
				<span class="title">Add Node</span>
				<div class="start-node node-prototype node">
					<span class="node-title">Start</span>
					<div class="tcp"></div>
				</div>
				<div class="success-node node-prototype node">
					<span class="node-title">Success</span>
				</div>
				<div class="fail-node node-prototype node">
					<span class="node-title">Fail</span>
				</div>
				<div class="approval-node node-prototype node">
					<span class="node-title">Approval</span>
					<div class="tcp"></div>
					<div class="fcp"></div>
				</div>
				<div class="notice-node node-prototype node">
					<span class="node-title">Notice</span>
					<div class="tcp"></div>
				</div>
				<div class="check-node node-prototype node">
					<span class="node-title">Check</span>
					<div class="tcp"></div>
					<div class="fcp"></div>
				</div>


			</div>
			<div id="property-panel" style="display: none">
				<div class="property" id="approval-property">
					<div class="property-inner">
						<span class="title">Approval Setting</span>
						<div class="property-item">
							<select id="approval-type" style="width: 200px"
								class="property-value">
								<option></option>
								<option value="super">Supervisor</option>
								<option value="lud">Level in User Department</option>
								<option value="ld">Level in a Department</option>
								<option value="spec">Specific user</option>
							</select>
						</div>
						<div class="property-item">
							<div id="approval-deptId-wrapper" style="display: none">
								<label>Dept Id</label><br> <input id="approval-deptId"
									type="text" class="property-value"> <input
									type="submit" class="search-btn" value="submit">

							</div>
						</div>
						<div class="property-item">
							<div id="approval-superLv-wrapper" style="display: none">
								<label>Super Level</label><br> <input id="approval-superLv"
									type="text" class="property-value">

							</div>
						</div>
						<div class="property-item">
							<div id="approval-employeeId-warpper" style="display: none">
								<label>Employee Id<br>
									<div class="input-append">
										<input type="text" id="approval-employeeId"
											class="property-value appendedInputButtons" disabled>
										<a class="btn"
											onClick='userId = this.parentNode.children[0]; dataitem = window.open("searchUser.html","dataitem", "width=300,height=500,toolbar=no,menubar=no,scrollbars=yes"); dataitem.userId = userId'>Search</a>
									</div>
								</label>

							</div>
						</div>
						<div class="property-submit-wrapper">
							<button class="property-submit-btn css_btn_class">Submit</button>
							<button class="property-cancel-btn css_btn_class">Cancel</button>
						</div>
					</div>
				</div>
				<div class="property" id="notice-property">
					<div class="property-inner">
						<span class="title">Notice Setting</span>
						<div class="property-item">
							<select id="notice-type" class="property-value"
								style="width: 200px">
								<option></option>
								<option value="email">Notify by Email</option>
								<option value="system">Notify by System</option>
							</select>
						</div>
						<div class="property-item">
							<div id="notice-employeeId-warpper" style="display: none">
								<label>Employee Id</label><br>
								<div class="input-append">
									<input type="text" id="notice-employeeId"
										class="property-value" disabled> <input type="submit"
										class="search-btn" value="submit"> <a class="btn"
										onClick='userId = this.parentNode.children[0]; dataitem = window.open("searchUser.html","dataitem", "width=300,height=500,toolbar=no,menubar=no,scrollbars=yes"); dataitem.userId = userId'>Search</a>
								</div>
							</div>
						</div>

						<div class="property-item">
							<div id="notice-email-warpper" style="display: none">
								<label>Email Address</label><br> <input type="text"
									id="notice-email" class="property-value">
							</div>
						</div>
						<div class="property-item">
							<div id="notice-message-warpper" style="">
								<label>Additional Mesaage</label><br>
								<textarea rows="4" cols="50"  id="notice-message"
									class="property-value"></textarea>
							
							</div>
						</div>

						<div class="property-submit-wrapper">
							<button class="property-submit-btn css_btn_class">Submit</button>
							<button class="property-cancel-btn css_btn_class">Cancel</button>
						</div>
					</div>
				</div>
				<div class="property" id="check-property">
					<span class="title">Check Setting</span>
					<div class="property-item"></div>
					<div class="property-submit-wrapper">
						<button class="property-submit-btn css_btn_class">Submit</button>
						<button class="property-cancel-btn css_btn_class">Cancel</button>
					</div>

				</div>
			</div>


		</div>
</body>
</html>