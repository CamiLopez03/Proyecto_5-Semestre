document.addEventListener("DOMContentLoaded", function () {
// Animaciones
AOS.init({
  duration: 1000,
  once: true
});

// Carrusel
let currentSlide = 0;
const slides = document.querySelectorAll(".slide");

function changeSlide() {
  slides[currentSlide].classList.remove("active");
  currentSlide = (currentSlide + 1) % slides.length;
  slides[currentSlide].classList.add("active");
}

setInterval(changeSlide, 4500);

// Mapa de Colombia
const map = L.map("map").setView([4.5709, -74.2973], 6);

const iconoSede = L.divIcon({
  className: "",
  html: `
    <div style="
      position: relative;
      width: 18px;
      height: 18px;
      background: white;
      border-radius: 50%;
      border: 3px solid #C62828; /* borde rojo corporativo */
      box-shadow: 0 0 10px rgba(0,0,0,0.4);
    ">
      <div style="
        position: absolute;
        top: 50%;
        left: 50%;
        width: 40px;
        height: 40px;
        background: rgba(198, 40, 40, 0.3);
        border-radius: 50%;
        transform: translate(-50%, -50%);
        animation: pulse 1.5s infinite;
      "></div>
    </div>
  `,
  iconSize: [20, 20]
});

L.marker([8.74798, -75.88143], { icon: iconoSede })
  .addTo(map)
  .bindPopup(`
    <strong>Montería</strong><br>
    Sede de la empresa
  `)
  .openPopup();

fetch("/static/colombia.geojson")
  .then(res => res.json())
  .then(data => {
    const colombiaLayer = L.geoJSON(data, {
      style: {
        color: "#8B0000",      // borde rojo oscuro
        weight: 2,
        fillColor: "#C62828",  // rojo principal
        fillOpacity: 0.6
      }
    }).addTo(map);

    map.fitBounds(colombiaLayer.getBounds());
    })
    .catch(error => {
      console.error("Error cargando GeoJSON:", error);
  });

const colombiaBounds = [
  [ -4.5, -81.7 ],
  [ 13.5, -66.8 ]
];

fetch("/static/colombia.geojson")
  .then(res => res.json())
  .then(data => {

    const colombiaLayer = L.geoJSON(data, {
      style: {
        color: "#8B0000",
        weight: 2,
        fillColor: "#C62828",
        fillOpacity: 0.6
      },

      onEachFeature: function (feature, layer) {

        const nombre = feature.properties.NOMBRE_DPT || "Departamento";

        layer.bindPopup(`<strong>${nombre}</strong>`);

        layer.on({
          mouseover: function () {
            layer.setStyle({
              fillColor: "#FF5252",
              fillOpacity: 0.9
            });
          },
          mouseout: function () {
            layer.setStyle({
              fillColor: "#C62828",
              fillOpacity: 0.6
            });
          }
        });

      }

    }).addTo(map);

    map.fitBounds(colombiaLayer.getBounds());

  });

map.setMaxBounds(colombiaBounds);


// Zonas de ejemplo
const zonasTrabajo = [
  {
    ciudad: "La Unión (Sucre)",
    coords: [8.8606, -75.2833],
    descripcion: "Proyecto en el municipio de La Unión, Sucre.",
    scroll: false
  },
  {
    ciudad: "Abriaquí (Antioquia)",
    coords: [6.6278, -76.0647],
    descripcion: "Proyecto en Abriaquí, Antioquia.",
    scroll: false
  },
  {
    ciudad: "Montelíbano (Córdoba)",
    coords: [7.9792, -75.4200],
    descripcion: "Proyecto en Montelíbano, Córdoba.",
    scroll: true
  },
  {
    ciudad: "Majagual (Sucre)",
    coords: [8.5361, -74.6314],
    descripcion: "Proyecto en Majagual, Sucre.",
    scroll: true
  },
  {
    ciudad: "Moñitos (Córdoba)",
    coords: [9.2456, -76.1361],
    descripcion: "Proyecto en Moñitos, Córdoba.",
    scroll: true
  }
];

zonasTrabajo.forEach(zona => {

  const marker = L.marker(zona.coords).addTo(map);

  if (zona.scroll) {
    marker.bindPopup(`
      <strong>${zona.ciudad}</strong><br>
      ${zona.descripcion}<br><br>
      <button class="boton-mapa" onclick="irAProyecto('${zona.ciudad}')">
        Ver proyecto
      </button>
    `);

    marker.on("click", function () {
      irAProyecto(zona.ciudad);
    });

  } else {
    marker.bindPopup(`
      <strong>${zona.ciudad}</strong><br>
      ${zona.descripcion}
    `);
  }

});

function irAProyecto(ciudad) {
  const id = ciudad
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "") // quita tildes
    .replace(/\s+/g, "");

  const elemento = document.getElementById(id);

  if (elemento) {
    elemento.scrollIntoView({ behavior: "smooth" });
  }
}

// Formulario provisional
const form = document.querySelector(".contact-form");

form.addEventListener("submit", function(e) {
  e.preventDefault();
  alert("Mensaje enviado correctamente. Más adelante se conectará con la base de datos.");
  form.reset();
});
});