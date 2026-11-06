
--Ejemplo resuelto, 
--Ventas con el nombre y el total de cada producto

SELECT 
	v.venta_id,
	p.nombre,
	p.categoria,
	v.cantidad,
	(v.cantidad * p.precio) AS total
FROM ventas v
JOIN productos p 
ON v.producto_id = p.producto_id


-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: Astrid Puma Alvites
-- Fecha: 05/11/2026
-- ══════════════════════════════════════════

-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.
-- [Tu consulta aquí]
SELECT
	p.producto_id,
	p.nombre,
	p.categoria,
	v.cantidad,
	(v.cantidad * p.precio) AS total
FROM productos p
LEFT JOIN ventas v ON p.producto_id = v.producto_id
WHERE v.venta_id IS NULL
-- [Respuesta] 
--Los productos del catálogo que nunca se vendieron son: 
		-- 1) 108, Hub USB-C 7p, de la categoría Accesorios
		-- 2) 109, Parlante Bluetooth, de la categoría Audio

-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.

-- [Tu consulta aquí]
SELECT
	v.venta_id, 
	p.producto_id,
	p.nombre,
	p.categoria,
	v.cantidad
FROM productos p
RIGHT JOIN ventas v ON p.producto_id = v.producto_id
WHERE p.producto_id IS NULL

--[Respuesta]
	--Si existe una venta registrada con un producto que no figura en nuestro catálogo. Es la venta con venta_id: 10.

-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

-- [Tu consulta aquí]
SELECT
*,
(v.cantidad * p.precio) AS total
FROM productos p
FULL OUTER JOIN ventas v ON p.producto_id = v.producto_id