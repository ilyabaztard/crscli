#Использовать crs-api

Процедура ОписаниеКоманды(Знач КомандаПриложения) Экспорт
	
	КомандаПриложения.Опция("u url", , "Строка подключения к хранилищу");
	КомандаПриложения.Опция("r reponame", , "Имя хранилища");
	КомандаПриложения.Опция("v version", , "Версия хранилища");

КонецПроцедуры

Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт
	
	АдресХранилища = КомандаПриложения.ЗначениеОпции("url");
	ИмяХранилища = КомандаПриложения.ЗначениеОпции("reponame");
	ВерсияПлатформы = КомандаПриложения.ЗначениеОпции("version");

	ХранилищеСуществует = МенеджерХранилищ.ХранилищеСуществует(АдресХранилища, ИмяХранилища, ВерсияПлатформы);

	Если ХранилищеСуществует = Истина Тогда
		ЗавершитьРаботу(0);
	Иначе
		ЗавершитьРаботу(1);
	КонецЕсли;
	
КонецПроцедуры
