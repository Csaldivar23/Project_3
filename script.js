console.log("Script loaded");

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>

// 1. Load your JSON
fetch('output.geojson')
  .then(response => response.json())
  .then(data => {

    // 2. Initialize Leaflet map
    const map = L.map('map').setView([0, 0], 2); 

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Load GeoJSON data
    fetch('output.geojson') 
      .then(response => response.json())
      .then(geojson => {

        // Define style for GeoJSON features
        function style(feature) {
          return {
            fillColor: getColor(feature.properties.DisasterType), 
            weight: 2,
            opacity: 1,
            color: 'white',
            dashArray: '3',
            fillOpacity: 0.7
          };
        }

        // Define color based on DisasterType
        function getColor(disasterType) {
          switch (disasterType) {
            case 'Flood': return '#1f77b4';
            case 'Earthquake': return '#ff7f0e';
            case 'Hurricane': return '#2ca02c';
            default: return '#d62728';
          }
        }

        // Add GeoJSON layer with onEachFeature event
        L.geoJson(geojson, { style: style, onEachFeature: onEachFeature }).addTo(map);

        // Define what happens on clicking a feature
        function onEachFeature(feature, layer) {
          layer.on({
            click: function(e) {
              // Display data in a popup
              const popupContent = `
                <h2>${feature.properties.Region}</h2>
                <p>Disaster Type: ${feature.properties.DisasterType}</p>
                <p>Total Deaths: ${feature.properties.TotalDeaths}</p>
                <p>No. Homeless: ${feature.properties.NoHomeless}</p>
                <p>Total Affected: ${feature.properties.TotalAffected}</p>
              `;
              layer.bindPopup(popupContent).openPopup();
            }
          });
        }
      });
  });

// Disaster type dropdown filter
const disasterTypeSelect = document.getElementById('disasterTypeSelect');
disasterTypeSelect.addEventListener('change', () => {
  const selectedDisasterType = disasterTypeSelect.value;

  // Fetch GeoJSON and apply filtering
  fetch('output.geojson')
    .then(response => response.json())
    .then(geojson => {
      // Clear existing layers
      map.eachLayer(layer => {
        if (layer instanceof L.GeoJSON) {
          map.removeLayer(layer);
        }
      });

      // Filter the GeoJSON data based on the selected disaster type
      const filteredGeojson = {
        type: 'FeatureCollection',
        features: geojson.features.filter(feature => {
          return !selectedDisasterType || feature.properties.DisasterType === selectedDisasterType;
        })
      };

      // Add filtered data to the map
      L.geoJson(filteredGeojson, { style: style, onEachFeature: onEachFeature }).addTo(map);
    });
});