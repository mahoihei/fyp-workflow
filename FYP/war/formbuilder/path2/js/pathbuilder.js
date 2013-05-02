var selectedNode = false;
var nodeId = 0;
var selectedWay;
$(document).ready(
		function() {
			jsPlumb.importDefaults({
				ConnectionOverlays : [ [ "Arrow", {
					location : 0.9
				} ], [ "Label", {
					location : 0.1,
					id : "label",
					cssClass : "aLabel"
				} ] ],
				ConnectorZIndex : 5
			});
			

			$(".node-prototype").click(function() {
				$(".node-prototype").css("box-shadow", "");
				$(this).css("box-shadow", "10px 10px 5px #888888");
				selectedNode = $(this).clone();
				selectedNode.removeClass("node-prototype");
				selectedNode.addClass("node-instance");
				var id = "node-" + nodeId++;
				selectedNode.attr("id", id);
				var node = new Node(id);
				selectedNode.data("props",node);
				
				
				
				$(".tcp").mousedown(function() {
					selectedWay = true;
				});
				$(".fcp").mousedown(function() {
					selectedWay = false;
				});
			});

			$(".approval-node.node-prototype").click(function() {
				var data = selectedNode.data("props");
				data.setType("approval");
			});
			$(".notice-node.node-prototype").click(function() {
				var data = selectedNode.data("props");
				data.setType("notice");
			});
			$(".check-node.node-prototype").click(function() {
				var data = selectedNode.data("props");
				data.setType("check");
			});
			
			
			$(".start-node.node-prototype").click(function() {
				var data = selectedNode.data("props");
				data.setType("start");
			});
			$(".success-node.node-prototype").click(function() {
				var data = selectedNode.data("props");
				data.setType("success");
			});
			$(".fail-node.node-prototype").click(function() {
				var data = selectedNode.data("props");
				data.setType("fail");
			});




			$("#path-canvas").click(
					function(e) {
						$(".node-prototype").css("box-shadow", "");
						if (selectedNode == false)
							return
						var offset = $(this).parent().offset();
						var xp = e.pageX - offset.left;
						var yp = e.pageY - offset.top;
						
						var props = selectedNode.data("props");
						selectedNode.css("position", "absolute");
						selectedNode.css("top", yp);
						selectedNode.css("left", xp);
						//props.updatePosition(xp,yp);
						$(this).append(selectedNode);
//						selectedNode.click(function(){
//							showPropertyPanel(props);
//						});
						selectedNode.mouseup(function(e){
							var data = $(this).data("props");
							data.updatePosition($(this).offset().left,$(this).offset().top);
						});
						jsPlumb.makeTarget(selectedNode, {
							dropOptions : {
								hoverClass : "dragHover"
							},
							anchor : "Continuous"
						});
						jsPlumb.draggable(selectedNode);

						jsPlumb.makeSource(selectedNode.children(".tcp"), {
							parent : selectedNode,
							anchor : "Continuous",
							connector : [ "Flowchart", {
								curviness : 20
							} ],
							connectorStyle : {
								strokeStyle : "#0fff00",
								lineWidth : 2
							},
							maxConnections : 2,
							onMaxConnections : function(info, e) {
								alert("Maximum connections ("
										+ info.maxConnections + ") reached");
							}
						});
						jsPlumb.makeSource(selectedNode.children(".fcp"), {
							parent : selectedNode,
							anchor : "Continuous",
							connector : [ "Flowchart", {
								curviness : 20
							} ],
							connectorStyle : {
								strokeStyle : "#ff0000",
								lineWidth : 2
							},
							maxConnections : 2,
							onMaxConnections : function(info, e) {
								alert("Maximum connections ("
										+ info.maxConnections + ") reached");
							}
						});

						selectedNode = false;
					});
			
			
			
			jsPlumb.bind("click", function(conn, originalEvent) {
				if (confirm("Delete connection from " + conn.sourceId + " to "
						+ conn.targetId + "?"))
					jsPlumb.detach(conn);
			});

			jsPlumb.bind("jsPlumbConnection", function(connectionInfo) {
				console.log(connectionInfo);
				console.log(connectionInfo.source[0]);
				if(selectedWay)
					$(connectionInfo.source[0]).data("props").addTcp(connectionInfo.targetId);
				else
					$(connectionInfo.source[0]).data("props").addFcp(connectionInfo.targetId);
			});

			jsPlumb.bind("jsPlumbConnectionDetached", function(connectionInfo) {
				console.log(connectionInfo);
				$(connectionInfo.source[0]).data("props").removeLink(connectionInfo.targetId);
				/*
				if($(connectionInfo.source[0]).data("props").pass == connectionInfo.targetId)
					delete $(connectionInfo.source[0]).data("props").pass;
				else
					delete $(connectionInfo.source[0]).data("props").fail;
				*/
//				delete connectionInfo.source[0].data("props").pass;
//				delete connectionInfo.source[0].data("props").fail;
				
			});
			$("select").select2({
				
			});
			$.contextMenu({
		        selector: '.node-instance', 
		        callback: function(key, options) {
		            switch(key){
		            case "delete":
		            	$(this).remove();
		            	break;
		            	
		            case "setting":
		            	console.log($(this).data());
		            	$(this).data("props").loadMenu();
		            	$("#property-panel").data("props",$(this).data("props"));
		            	break;
		            }
		            
		            
		        },
		        items: {
		            "delete": {name: "Delete", icon: "delete"},
		            "setting": {name:"Setting", icon: "setting"},
		            
		        }
		    });
			$("#save-btn").click(function(){
				var result = [];
				$("#path-canvas").children().each(function(i,e){
					if($(this).hasClass("node")){
						result.push(JSON.stringify($(this).data("props")));
					}
				});

				result=JSON.stringify(result);
				$.post("../addFormPath"
						,{
							path : result
						})
						.always(function(data) {
							alert(data);
						});
			});

		});
function showPropertyPanel(data){
	$(".property").hide();
	switch(data.type){
		case "approval":
			$("#approval-property").show()
			break;
		case "notice":
			$("#notice-property").show()
			break;
		case "check":
			$("#check-property").show();
			break;
			
			
	}
}