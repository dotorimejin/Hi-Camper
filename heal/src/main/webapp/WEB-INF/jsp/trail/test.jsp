<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/d3.js"></script>
</head>
<body>
<script type="text/javascript">
	d3.json('/json/trail/11/11 (1).json', function(json) {
	consol.log(json);
	/*trails
 		.selectAll('path')
 		.data(json.features)
 		.enter()
        .append('path')
        .attr('d', path)
        .attr('id', function(d) {
            return 'path-' + d.properties.geometry.paths[0];
        });*/
        
        });
	
	
	/*d3.json('/resources/json/trail/11/PMNTN_갈현근린공원_113800804.json', function(data) {
	    console.log("trail Name :"+data[key].features.attributes.MNTN_NM+" , trail path :"+data[key].features.geometry.paths);
			}
	    });*/
</script>
</body>
</html>