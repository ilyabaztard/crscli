#Использовать crs-api

Процедура ОписаниеКоманды(Знач КомандаПриложения) Экспорт
	
	КомандаПриложения.Опция("u url", , "Строка подключения к хранилищу");
	КомандаПриложения.Опция("r reponame", , "Имя хранилища");
	КомандаПриложения.Опция("v version", , "Версия хранилища");
	КомандаПриложения.Опция("l login", , "Имя пользователя хранилища");
	КомандаПриложения.Опция("p password", , "Пароль пользователя хранилища");
	КомандаПриложения.Опция("n username", , "Имя удаляемого пользователя");


КонецПроцедуры

Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт
	
	АдресХранилища = КомандаПриложения.ЗначениеОпции("url");
	ИмяХранилища = КомандаПриложения.ЗначениеОпции("reponame");
	ВерсияПлатформы = КомандаПриложения.ЗначениеОпции("version");
	Пользователь = КомандаПриложения.ЗначениеОпции("login");
	Пароль = КомандаПриложения.ЗначениеОпции("password");
	Имя = КомандаПриложения.ЗначениеОпции("username");
	
	КлиентХранилища = Новый КлиентХранилища(АдресХранилища, ВерсияПлатформы);
	КлиентХранилища.Подключиться(Пользователь, Пароль, ИмяХранилища);	
	
	ПользовательХранилища = КлиентХранилища.НайтиПользователя(Имя);

	Если ПользовательХранилища = Неопределено Тогда
		Сообщить("Не найден пользователь " + Имя);
		ЗавершитьРаботу(1);
	КонецЕсли;
	
	КлиентХранилища.ВосстановитьПользователя(ПользовательХранилища.Идентификатор);

КонецПроцедуры
