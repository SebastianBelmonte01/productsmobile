# Prueba técnica
## Correr backend

1. Ir a la carpeta
```bash
cd backend
```
2. Restaurar dependencias
```bash
dotnet restore
```

3. Ejecutar backend
```bash
dotnet run
```

## Correr frontend

1. Ir a la carpeta
```bash
cd frontend
```
2. Instalar dependencias
```bash
flutter pub get
```

3. Ejecutar app
```bash
flutter run
```

## Decisiones técnicas

1. Se utilizó una arquitectura por capas MVC.
2. Se utilizó EF Core para realizar las consultas.
3. Se utilizaron DTOs.
4. Se implementó paginación con scroll infinito en el frontend.
5. Se utilizaron rutas entre pantallas en el frontend.
6. Se utilizó Provider para manejar los estados en el frontend.

## Posibles mejoras

1. Implementar debounce en la búsqueda
2. Skeleton para loading
3. Implementar indices en la BD
4. Utilizar unit tests
