# ARToaster
ARToaster is display message on screen for some time.

# Usage
Ex. 
let config = ARToasterConfigs(messageColor: .white, messageFont: UIFont.systemFont(ofSize: 12, weight: .regular), messageAlignment: .center, backgrounColor: .black)
ARToaster(message: staticMessage, duration: 5, position: .top, status: .success, config: config)

