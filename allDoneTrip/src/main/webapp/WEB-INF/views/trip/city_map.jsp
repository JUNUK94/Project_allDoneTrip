<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#map {
		        width: 100%;
		        height: 400px;
		        background-color: grey;
		      }
	</style>
	<script>
		// Initialize and add the map
		function initMap() {
		  // The location of Uluru
		  var uluru = {lat: -25.344, lng: 131.036};
		  // The map, centered at Uluru
		  var map = new google.maps.Map(
		      document.getElementById('map'), {zoom: 4, center: uluru});
		  // The marker, positioned at Uluru
		  var marker = new google.maps.Marker({position: uluru, map: map});
		}
	</script>
</head>
<body onload="initMap()">    

	<h3>map</h3>
    <!--The div element for the map -->
    <div id="map"></div>


</body>

</html>