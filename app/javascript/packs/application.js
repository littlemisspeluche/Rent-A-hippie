import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';

initUpdateNavbarOnScroll();
console.log("hello")

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();