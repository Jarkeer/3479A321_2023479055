# Buscaminas

Un proyecto desarrollado en Flutter que implementa el clásico juego del Buscaminas, que integra características avanzadas de hardware, persistencia de datos y arquitectura de software para dispositivos móviles.

## Características Principales

* **Arquitectura Limpia:** Implementación del patrón de diseño MVVM (Model-View-ViewModel)
* **Gestión de Estados Reactivos:** Uso de `Provider` y `ChangeNotifier` para actualizar la interfaz en tiempo real sin recargar la aplicación.
* **Persistencia de Datos:** Almacenamiento local mediante `shared_preferences` para guardar el nombre del jugador y la dificultad seleccionada.
* **Integración de Hardware:** Uso del Acelerómetro a través de `sensors_plus` para reiniciar la partida automáticamente al agitar el dispositivo.
* **Reproducción de Medios:** Integración de efectos de sonido mediante `audioplayers` para interactuar con casillas seguras y explosiones.
* **Interoperabilidad del SO:** Conexión con el menú nativo de Android/iOS mediante `share_plus` para compartir puntuaciones y desafiar a otros jugadores.
* **Identidad Digital:** Configuración completa, incluyendo ícono de aplicación personalizado (`flutter_launcher_icons`) y un nombre de paquete único (`change_app_package_name`).

## Requisitos de Entorno

* Flutter SDK: ^3.11.3
* Dispositivo físico Android/iOS (para Probar el acelerómetro).

## Trabajos Futuros

Como parte de la evolución continua de esta aplicación, se proponen las siguientes mejoras para futuras actualizaciones:

1.  **Tabla de Puntuación:** Implementar una base de datos en la nube (ej. Firebase) para registrar y comparar los tiempos récord de supervivencia entre diferentes usuarios.
2.  **Retroalimentación:** Sumar pequeñas vibraciones (Haptic Feedback) al momento de colocar una bandera o detonar una mina para mejorar la inmersión táctil.
3.  **Animaciones Fluidas:** Añadir transiciones y animaciones al momento de revelar múltiples celdas vacías en cascada o al cambiar de pantallas.

---
**Desarrollado por:** Javier Alonso Molina Duran