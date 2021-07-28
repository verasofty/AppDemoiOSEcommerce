# AppDemoiOSEcommerce

# Change List :green_book:

Version | Autor | Fecha | Descripcion
--------|---------------------|------------|----------------
1.0 | Judá Escalera| 2020-02-04 | Version inicial
1.1 | Judá Escalera| 2020-09-24 | Comentarios agregados
1.2 | Judá Escalera| 2021-07-25 | Añade respuesta KashPayResponse

# Integración con el proyecto

## Configuración

Procedimiento

1.- Una vez descargada la carpeta **CardData.framework**, se arrastra y suelta en la raíz del proyecto
<img width="530" alt="Captura de Pantalla 2021-07-27 a la(s) 23 46 46" src="https://user-images.githubusercontent.com/28871704/127265544-67e32286-6a07-46f6-ae79-97f2c65d0dd1.png">

2.- Una vez agregado, seleccionamos el proyecto, target -> Frameworks, libraries and Embedded Content y en nuestro framework lo seteamos como *Embed & Sign*
<img width="1229" alt="Captura de Pantalla 2021-07-27 a la(s) 23 50 22" src="https://user-images.githubusercontent.com/28871704/127266005-62c500f7-41b3-4a4b-befb-bd45d660612a.png">

## Uso del framework

1.- Añadir el *Protocol* **CallbackTransaction**, e implementar el método de **completedTransaction()**
```swift 
class ViewController: UIViewController, CallbackTransaction {
```
   En este método, se recibirá la respuesta de la transacción, siendo validada por medio de *response.sucess*, para saber si fue correcta o no respectivamente.

```swift 
    func completedTransaction(response: KashPayResponse) {
        print("== completedTransaction() ==")
        
        if (response.success) {
            lbData.textColor = .black
            lbData.text = "Transacción realizada con éxitoso! \nNúmero de autorización: \(response.authorizationNumber ?? "000")"
        } else {
            lbData.textColor = .red
            lbData.text = "Transacción NO realizada! \nError: \(response.errorMessage ?? "errorMessage")"
        }
    }
```

