// ======================
// ANIMACIONES AOS
// ======================
if (typeof AOS !== "undefined") {
  AOS.init({
    duration: 1000,
    once: true
  });
}

// ======================
// MAPA
// ======================
const mapElement = document.getElementById("map");

if (mapElement && typeof L !== "undefined") {
  const map = L.map("map").setView([4.5709, -74.2973], 6);

  const iconoSede = L.divIcon({
    className: "",
    html: `
      <div style="
        width: 18px;
        height: 18px;
        background: #981313;
        border: 3px solid white;
        border-radius: 50%;
        box-shadow: 0 0 10px rgba(0,0,0,0.4);
      "></div>
    `,
    iconSize: [20, 20]
  });

  L.marker([8.74798, -75.88143], { icon: iconoSede })
    .addTo(map)
    .bindPopup("Montería<br>Sede de la empresa")
    .openPopup();

  fetch("/static/js/colombia.geojson")
    .then(res => res.json())
    .then(data => {
      const colombiaLayer = L.geoJSON(data, {
        style: {
          color: "#8B0000",
          weight: 2,
          fillColor: "#C62828",
          fillOpacity: 0.6
        },

        onEachFeature: function(feature, layer) {
          const nombre = feature.properties.NOMBRE_DPT || "Departamento";

          layer.bindPopup(`${nombre}`);

          layer.on({
            mouseover: function() {
              layer.setStyle({
                fillColor: "#FF5252",
                fillOpacity: 0.9
              });
            },
            mouseout: function() {
              layer.setStyle({
                fillColor: "#C62828",
                fillOpacity: 0.6
              });
            }
          });
        }
      }).addTo(map);

      map.fitBounds(colombiaLayer.getBounds());
    })
    .catch(error => {
      console.error("Error cargando colombia.geojson:", error);
    });

  map.setMaxBounds([
    [-4.5, -81.7],
    [13.5, -66.8]
  ]);

  const zonasTrabajo = [
    {
      nombre: "La Unión (Sucre)",
      coords: [8.8606, -75.2833],
      descripcion: "Proyecto en el municipio de La Unión, Sucre.",
      scroll: false
    },
    {
      nombre: "Abriaquí (Antioquia)",
      coords: [6.6278, -76.0647],
      descripcion: "Proyecto en Abriaquí, Antioquia.",
      scroll: false
    },
    {
      nombre: "Montelíbano",
      id: "montelibano",
      coords: [7.9792, -75.4200],
      descripcion: "Proyecto en Montelíbano, Córdoba.",
      scroll: true
    },
    {
      nombre: "Majagual",
      id: "majagual",
      coords: [8.5361, -74.6314],
      descripcion: "Proyecto en Majagual, Sucre.",
      scroll: true
    },
    {
      nombre: "Moñitos",
      id: "monitos",
      coords: [9.2456, -76.1361],
      descripcion: "Proyecto en Moñitos, Córdoba.",
      scroll: true
    }
  ];

  zonasTrabajo.forEach(zona => {
    const marker = L.marker(zona.coords).addTo(map);

    if (zona.scroll) {
      marker.bindPopup(`
        <strong>${zona.nombre}</strong><br>
        ${zona.descripcion}<br><br>
        <button class="boton-mapa" onclick="irAProyecto('${zona.id}')">
          Ver proyecto
        </button>
      `);

      marker.on("click", function () {
        irAProyecto(zona.id);
      });

    } else {
      marker.bindPopup(`
        <strong>${zona.nombre}</strong><br>
        ${zona.descripcion}
      `);
    }
  });
}

// ======================
// FUNCIÓN SCROLL PROYECTOS
// ======================
window.irAProyecto = function(id) {
  const elemento = document.getElementById(id);

  if (elemento) {
    elemento.scrollIntoView({
      behavior: "smooth"
    });

    elemento.style.boxShadow = "0 0 25px rgba(198,40,40,0.7)";

    setTimeout(() => {
      elemento.style.boxShadow = "";
    }, 1500);

  } else {
    console.log("No se encontró:", id);
  }
};

// ======================
// FORMULARIO CONTACTO
// ======================
const form = document.querySelector(".contact-form");
const popup = document.getElementById("custom-popup");
const popupBtn = document.getElementById("popup-btn");

if (form && popup && popupBtn) {
  form.addEventListener("submit", function(e) {
    e.preventDefault();

    const nombre = form.querySelector('[name="nombre"]').value.trim();
    const telefono = form.querySelector('[name="telefono"]').value.trim();
    const correo = form.querySelector('[name="correo"]').value.trim();
    const servicio = form.querySelector('[name="servicio"]').value.trim();
    const mensaje = form.querySelector('[name="mensaje"]').value.trim();

    if (!nombre || !telefono || !correo || !servicio || !mensaje) {
      alert("Por favor completa todos los campos.");
      return;
    }

    popup.classList.add("active");
  });

  popupBtn.addEventListener("click", () => {
    popup.classList.remove("active");

    setTimeout(() => {
      form.submit();
    }, 500);
  });
}

// ======================
// CARRUSEL SERVICIOS PRINCIPAL
// ======================
let servicioActual = 0;

function mostrarServicio(index) {
  const slides = document.querySelectorAll(".servicio-slide");
  const dots = document.querySelectorAll(".servicio-dots .dot");

  if (!slides.length) {
    return;
  }

  if (index >= slides.length) {
    servicioActual = 0;
  } else if (index < 0) {
    servicioActual = slides.length - 1;
  } else {
    servicioActual = index;
  }

  slides.forEach(slide => {
    slide.classList.remove("active");
  });

  dots.forEach(dot => {
    dot.classList.remove("active");
  });

  slides[servicioActual].classList.add("active");

  if (dots[servicioActual]) {
    dots[servicioActual].classList.add("active");
  }
}

function cambiarServicio(direccion) {
  mostrarServicio(servicioActual + direccion);
}

function irServicio(index) {
  mostrarServicio(index);
}

// ======================
// CARRUSEL ANTIGUO, SI EXISTE
// ======================
const track = document.querySelector(".slider-track");
const slides = document.querySelectorAll(".service");
const nextBtn = document.querySelector(".next");
const prevBtn = document.querySelector(".prev");

let index = 0;

function updateSlider() {
  if (track) {
    track.style.transform = `translateX(-${index * 100}%)`;
  }
}

if (track && slides.length > 0 && nextBtn && prevBtn) {
  nextBtn.addEventListener("click", () => {
    index++;

    if (index >= slides.length) {
      index = 0;
    }

    updateSlider();
  });

  prevBtn.addEventListener("click", () => {
    index--;

    if (index < 0) {
      index = slides.length - 1;
    }

    updateSlider();
  });
}

// ======================
// MODAL CLIENTES CONSTRUCTORA
// ======================
const modal = document.getElementById("client-modal");
const openBtn = document.getElementById("open-client-modal");
const closeBtn = document.getElementById("close-client-modal");

if (openBtn && modal) {
  openBtn.addEventListener("click", () => {
    modal.classList.add("active");
  });
}

if (closeBtn && modal) {
  closeBtn.addEventListener("click", () => {
    modal.classList.remove("active");
  });
}

if (modal) {
  window.addEventListener("click", (e) => {
    if (e.target === modal) {
      modal.classList.remove("active");
    }
  });
}

// ======================
// POPUP ELIMINAR PROYECTO
// ======================
let proyectoEliminar = null;

function abrirPopupEliminar(id) {
  proyectoEliminar = id;

  const popupEliminar = document.getElementById("popupEliminar");

  if (popupEliminar) {
    popupEliminar.classList.add("active");
  }
}

function cerrarPopupEliminar() {
  const popupEliminar = document.getElementById("popupEliminar");

  if (popupEliminar) {
    popupEliminar.classList.remove("active");
  }
}

const btnConfirmarEliminar = document.getElementById("btnConfirmarEliminar");

if (btnConfirmarEliminar) {
  btnConfirmarEliminar.addEventListener("click", function() {
    if (proyectoEliminar) {
      window.location.href = "/eliminar_proyecto/" + proyectoEliminar;
    }
  });
}

// ======================
// VENTAS: ANTICIPO Y SALDO
// ======================
const inmuebleSelect = document.getElementById("inmuebleSelect");
const valorVenta = document.getElementById("valorVenta");
const slider = document.getElementById("anticipoSlider");
const porcentajeTexto = document.getElementById("porcentajeTexto");
const valorAnticipo = document.getElementById("valorAnticipo");
const saldoPendiente = document.getElementById("saldoPendiente");
const anticipoInput = document.getElementById("anticipoInput");
const saldoInput = document.getElementById("saldoInput");

function formatoMoneda(valor) {
  return new Intl.NumberFormat("es-CO", {
    style: "currency",
    currency: "COP",
    minimumFractionDigits: 0
  }).format(valor);
}

function calcularAnticipo() {
  if (
    !valorVenta ||
    !slider ||
    !porcentajeTexto ||
    !valorAnticipo ||
    !saldoPendiente ||
    !anticipoInput ||
    !saldoInput
  ) {
    return;
  }

  const precio = Number(valorVenta.value || 0);
  const porcentaje = Number(slider.value || 0);

  const anticipo = precio * porcentaje / 100;
  const saldo = precio - anticipo;

  porcentajeTexto.textContent = porcentaje + "%";
  valorAnticipo.textContent = formatoMoneda(anticipo);
  saldoPendiente.textContent = formatoMoneda(saldo);

  anticipoInput.value = anticipo;
  saldoInput.value = saldo;
}

if (inmuebleSelect && valorVenta && slider) {
  inmuebleSelect.addEventListener("change", function () {
    const opcion = this.options[this.selectedIndex];
    const precio = opcion.dataset.precio || 0;

    valorVenta.value = precio;
    slider.value = 0;

    calcularAnticipo();
  });

  slider.addEventListener("input", calcularAnticipo);
  slider.addEventListener("input", calcularAnticipo);
}
