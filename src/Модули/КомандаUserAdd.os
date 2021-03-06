#Использовать crs-api

Процедура ОписаниеКоманды(Знач КомандаПриложения) Экспорт
	
	КомандаПриложения.Опция("u url", , "Строка подключения к хранилищу");
	КомандаПриложения.Опция("r reponame", , "Имя хранилища");
	КомандаПриложения.Опция("v version", , "Версия хранилища");
	КомандаПриложения.Опция("l login", , "Имя пользователя хранилища");
	КомандаПриложения.Опция("p password", , "Пароль пользователя хранилища");

	КомандаПриложения.Опция("n username", , "Имя нового пользователя");
	КомандаПриложения.Опция("q userpassword", , "Пароль нового пользователя");
	КомандаПриложения.Опция("e role", РолиХранилища.ТолькоПросмотр, "Роль нового пользователя")
		.ТПеречисление()
		.Перечисление("ТолькоПросмотр", РолиХранилища.ТолькоПросмотр, "дополнительных прав в хранилище не выдано")
		.Перечисление("Разработчик", РолиХранилища.Разработчик, "возможность захвата объектов в хранилище")
		.Перечисление("РазработчикРасширенный", РолиХранилища.РазработчикРасширенный, "возможность захвата объектов и изменения состава версий в хранилище")
		.Перечисление("Администратор", РолиХранилища.Администратор, "полные права без ограничений")
	;


КонецПроцедуры

Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт
	
	АдресХранилища = КомандаПриложения.ЗначениеОпции("url");
	ИмяХранилища = КомандаПриложения.ЗначениеОпции("reponame");
	ВерсияПлатформы = КомандаПриложения.ЗначениеОпции("version");
	Пользователь = КомандаПриложения.ЗначениеОпции("login");
	Пароль = КомандаПриложения.ЗначениеОпции("password");
	ИмяНового = КомандаПриложения.ЗначениеОпции("username");
	ПарольНового = КомандаПриложения.ЗначениеОпции("userpassword");
	РольНового = КомандаПриложения.ЗначениеОпции("role");
	
	КлиентХранилища = Новый КлиентХранилища(АдресХранилища, ВерсияПлатформы);
	КлиентХранилища.Подключиться(Пользователь, Пароль, ИмяХранилища);	
	
	КлиентХранилища.СоздатьПользователя(ИмяНового, ПарольНового, РольНового);

КонецПроцедуры
