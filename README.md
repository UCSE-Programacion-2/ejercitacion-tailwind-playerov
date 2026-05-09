[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/QODCjRK4)
# Ejercitacion: Traduccion de CSS a Tailwind (Multipagina)

**Profesor:** Ing. Fabio D. Arganaraz

## Contexto de la actividad

Esta plantilla docente ya viene **resuelta con CSS tradicional** (`css/styles.css`) para que el estudiante tenga una referencia funcional de layout, color, tipografia, grillas, estados y responsive.

La tarea del alumno es **traducir esa solucion a Tailwind CSS**, sin perder estructura ni coherencia visual.

## Objetivo pedagogico

Que el alumno practique el pasaje de un diseno real (ya implementado en CSS) a utilidades Tailwind, aplicando contenidos acumulados:

- estructura HTML semantica;
- box model y espaciados;
- flexbox y grid;
- responsive design;
- jerarquia tipografica y color;
- estados interactivos (`hover`, `focus`) y transiciones.

## Estructura del repositorio

```txt
Ejercitacion-Tailwind/
├── index.html
├── pages/
│   ├── about.html
│   ├── faq.html
│   └── privacy.html
├── css/
│   └── styles.css          # Solucion base en CSS (referencia)
├── scripts/
│   └── classroom-check.sh
└── .github/workflows/
    ├── classroom.yml
    ├── ci.yml
    └── setup-issues.yml
```

## Consigna para el alumno

Tomando como referencia visual y estructural la version actual:

1. Migrar cada pagina a Tailwind (CDN).
2. Eliminar el enlace a `css/styles.css` en todos los HTML.
3. Mantener navegacion y contenido.
4. Reproducir el comportamiento responsive e interactivo de la version CSS.
5. Mantener los ids: `menu-principal`, `servicios-grid`, `stats-grid`, `faq-list`, `privacy-cards`.

## Requisitos tecnicos obligatorios (entrega final)

- Cada HTML debe incluir:
  - `<script src="https://cdn.tailwindcss.com"></script>`
- Ningun HTML debe enlazar:
  - `css/styles.css`
- Deben existir utilidades Tailwind para:
  - layout base (`flex`, `grid`);
  - responsive (`sm:`, `md:` o `lg:`);
  - interacciones (`hover:` o `focus:`).
- En el footer de todas las paginas debe figurar:
  - `Desarrollado por Nombre Apellido` (sin corchetes y con nombre real del alumno).

## Guia de traduccion por secciones

### 1) Home (`index.html`)

- Traducir header, hero, botones y cards.
- Mantener el contenedor `#servicios-grid`.
- Lograr grilla responsive (2 y 3 columnas en breakpoints mayores).

### 2) About (`pages/about.html`)

- Traducir bloque introductorio.
- Mantener `#stats-grid`.
- Resolver tarjetas de metricas en grilla responsive.

### 3) FAQ (`pages/faq.html`)

- Traducir shell principal y encabezado de seccion.
- Mantener `#faq-list`.
- Replicar divisores y feedback visual en hover.

### 4) Privacy (`pages/privacy.html`)

- Traducir bloque introductorio.
- Mantener `#privacy-cards`.
- Replicar cards con listas legibles y espaciadas.

## Criterios de evaluacion docente

Ademas del autograding:

- fidelidad visual respecto a la base en CSS;
- uso correcto y consistente de utilidades Tailwind;
- legibilidad y mantenimiento del HTML;
- calidad de responsive y estados interactivos.

## Autoevaluacion (GitHub Classroom)

Se incluye:

- `.github/workflows/classroom.yml`
- `.github/workflows/ci.yml`
- `.github/workflows/setup-issues.yml`
- `scripts/classroom-check.sh`

Los checks validan estructura, adopcion de Tailwind y presencia de patrones minimos en cada pagina.

## Nota para el equipo docente

El estado inicial de este repo (plantilla) esta en CSS tradicional para que:

- haya una referencia clara de "resultado esperado";
- el alumno practique migracion real;
- la correccion combine automatizacion + revision humana.

---

*Programacion II - Ejercitacion de traduccion a Tailwind CSS*
