<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

  <!-- Ztree3的资源文件（easyui有jQuery） -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/jslib/ztree3/css/zTreeStyle/zTreeStyle.css" type="text/css">
  <script type="text/javascript" src="<%=request.getContextPath()%>/jslib/ztree3/js/jquery.ztree.core-3.5.js"></script>
  
  
  <script type="text/javascript">

  	//设置树的节点对象
    var zTreeObj;
	var setting = {
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: 0
			},
			key: {
				url: "xUrl"
			}
		},
		callback: {
			onClick:function(e, id, node){
				var zTree = $.fn.zTree.getZTreeObj("tree");
				addTabs(node.name, node.url);
			}
		}
	};
	//设置节点全局
	var zTreeNodes;

	$(document).ready(function(){
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/taskType/taskTypeForZtree.do",
			data:{},
			dataType:"json",
			success:function (res){
				zTreeNodes = res;
				zTreeObj = $.fn.zTree.init($("#tree"), setting, zTreeNodes);
			}
		});
	});
	//获取树的数据
	function zTreeOnClick(event, treeId, treeNode) {
	    addTabs(treeNode.name,treeNode.url);
	}
  </script>
  

	  
  <ul id="tree" class="ztree" style="width:230px; overflow:auto;"></ul>
  
  
  
  
  