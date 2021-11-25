/**
 * d3.js 시도별 지도
 */

window.onload = function() {
    drawMap1('#sidomap');
    drawMap2('#trailmap');
};

	/* 지도 그리기 */
	function drawMap1(target) {
	    var width = 700; //지도의 넓이
	    var height = 700; //지도의 높이
	    var initialScale = 5500; //확대시킬 값
	    var initialX = -11900; //초기 위치값 X
	    var initialY = 4050; //초기 위치값 Y
	    var labels;
	
	    var projection = d3.geo
	        .mercator()
	        .scale(initialScale)
	        .translate([initialX, initialY]);
	    var path = d3.geo.path().projection(projection);
	    var zoom = d3.behavior
	        .zoom()
	        .translate(projection.translate())
	        .scale(projection.scale())
	        .scaleExtent([height, 800 * height])
	        .on('zoom', zoom);
	
	    var svg = d3
	        .select(target)
	        .append('svg')
	        .attr('width', width + 'px')
	        .attr('height', height + 'px')
	        .attr('id', 'map')
	        .attr('class', 'map')
	        .style("background-color","#fff");
	
	    var states = trails = svg
	        .append('g')
	        .attr('id', 'states')
	        .call(zoom);
	
	    states
	        .append('rect')
	        .attr('class', 'background')
	        .attr('width', width + 'px')
	        .attr('height', height + 'px')
	        .attr("fill", "#fff"); //지도 배경색
	        
	        
	    /*geoJson데이터 파싱하여 지도그리기 */
	    d3.json('/json/sidoMap.json', function(json) {
	        states
	            .selectAll('path') //지역 설정
	            .data(json.features)
	            .enter()
	            .append('path')
	            .attr('d', path)
	            .attr('id', function(d) {
	                return 'path-' + d.properties.name_eng;
	            });
	
	        labels = states
	            .selectAll('text')
	            .data(json.features) //라벨표시
	            .enter()
	            .append('text')
	            .attr('transform', translateTolabel)
	            .attr('id', function(d) {
	                return 'label-' + d.properties.name_eng;
	            })
	            .attr('text-anchor', 'middle')
	            .attr('dy', '.35em')
	            .text(function(d) {
	                return d.properties.name;
	            });
	    });
	    

    /* 텍스트 위치 (하드코딩으로 위치 조절) */
    function translateTolabel(d) {
        var arr = path.centroid(d);
        if (d.properties.code == 31) {
            //서울 경기도 이름 겹쳐서 경기도 내리기
            arr[1] +=
                d3.event && d3.event.scale
                    ? d3.event.scale / height + 20
                    : initialScale / height + 20;
        } else if (d.properties.code == 34) {
            //충남은 조금 더 내리기
            arr[1] +=
                d3.event && d3.event.scale
                    ? d3.event.scale / height + 10
                    : initialScale / height + 10;
        }
        return 'translate(' + arr + ')';
    }

    function zoom() {
        projection.translate(d3.event.translate).scale(d3.event.scale);
        states.selectAll('path').attr('d', path);
        labels.attr('transform', translateTolabel);
        trails.selectAll('path').attr('d', path);
    }
}

function drawMap2(target) {
	    var width = 700; //지도의 넓이
	    var height = 700; //지도의 높이
	    var initialScale = 5500; //확대시킬 값
	    var initialX = -11900; //초기 위치값 X
	    var initialY = 4050; //초기 위치값 Y
	
	    var projection = d3.geo
	        .mercator()
	        .scale(initialScale)
	        .translate([initialX, initialY]);
	    var path = d3.geo.path().projection(projection);
	    var zoom = d3.behavior
	        .zoom()
	        .translate(projection.translate())
	        .scale(projection.scale())
	        .scaleExtent([height, 800 * height])
	        .on('zoom', zoom);
	
	    var svg = d3
	        .select(target)
	        .append('svg')
	        .attr('width', width + 'px')
	        .attr('height', height + 'px')
	        .attr('id', 'map')
	        .attr('class', 'map')
	        .style("background-color","#fff");
	
	    var trails = svg
	        .append('g')
	        .attr('id', 'trails')
	        .call(zoom);
	    
	    trails
	        .append('rect')
	        .attr('class', 'background')
	        .attr('width', width + 'px')
	        .attr('height', height + 'px')
	        .attr("fill", "#000"); //지도 배경색
	        
	        
	    /* 등산로 그리기 */
	    d3.json('/resources/json/trail/11/11 (1).json', function(json) {
	        trails
	     		.selectAll('path')
	     		.data(json.features.geometry.paths[0])
	     		.enter()
	            .append('path')
	            .attr('d', path)
	
	    });
	    
	  function zoom() {
        projection.translate(d3.event.translate).scale(d3.event.scale);
        trails.selectAll('path').attr('d', path);
    }
}
