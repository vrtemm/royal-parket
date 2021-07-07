{
	"button": {
		"show": false,
		"text": "Request a callback"
	},
	"fields": [
		{
			"type": "text",
			"name": "Как Вас зовут?",
			"placeholder": "Введите Ваше имя",
			"required": true,
			"sms": true
		},
		{
			"type": "tel",
			"mask": "(999) 999-9999",
			"name": "Ваш номер телефона",
			"required": true,
			"sms": true
		},
		{
			"type": "textarea",
			"name": "Что желаете обсудить?",
			"placeholder": "Сообщение",
			"required": true,
			"sms": true
		}
	],
	"form": {
		"template": "default",
		"title": "Заказать обратный звонок",
		"button": "Позвоните мне", 
		"align": "center",
		"welcome": "Заказать обратный звонок"
	},
	"alerts": {
		"yes": "Yes",
		"no": "No",
		"process": "Отправка запроса...",
		"success": "Ваш запрос был успешно отправлен",
		"fails": {
			"required": "Пожалуйста, заполните все обязательные поля",
			"sent": "Предыдущее сообщение было отправлено менее чем минуту назад"
		}
	},
	"captcha": {
		"show": true,
		"title": "Captcha",
		"error": "Captcha is wrong"
	},
	"license": {
		"key": "422033305436423430283020423433305122272633304820421830205426",
		"show": true
	},
	"mail": {
		"referrer": "ссылающаяся страница",
		"url": "URL",
		"linkAttribute": "Link attribute",
		"smtp": false
	},
	"animationSpeed": 150,
	"sms": {
		"send": false,
		"captions": true,
		"cut": true
	}
}
