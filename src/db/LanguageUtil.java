package db;

import java.util.HashMap;

public class LanguageUtil {

    private static final HashMap<String, HashMap<String, String>> translation = new HashMap<>();

    static {
        HashMap<String, String> rusValues = new HashMap<>();
        rusValues.put("name", "Имя");
        rusValues.put("surname", "Фамилия");
        rusValues.put("allStudents", "Все Студенты");
        rusValues.put("citiess", "Города");
        rusValues.put("birthdate", "День Рождения");
        rusValues.put("city", "Город");
        rusValues.put("addStudent", "Добавить Студента");
        rusValues.put("details", "Подробности");
        rusValues.put("languages", "Языки");
        rusValues.put("Code", "Код");
        rusValues.put("addCity", "Добавить Город");
        rusValues.put("addNewStudent", "Добавить Нового Ученика");
        rusValues.put("addNewCity", "Добавить Новый Город");
        rusValues.put("close", "закрывать");
        rusValues.put("yes", "Да");
        rusValues.put("no", "Нет");
        rusValues.put("saveStudent", "Сохранить Студента");
        rusValues.put("deleteStudent", "Удалить Студента");
        rusValues.put("areYouSure", "Вы Уверены");
        rusValues.put("confirmDelete", "Подтвердите Удаление");
        rusValues.put("saveCity", "Сохранить Город");
        rusValues.put("deleteCity", "Удалить Город");
        rusValues.put("register", "Регистрация");

        translation.put("rus", rusValues);

        HashMap<String, String> engValues = new HashMap<>();
        engValues.put("name", "Name");
        engValues.put("surname", "Surname");
        engValues.put("allStudents", "All Students");
        engValues.put("citiess", "Cities");
        engValues.put("birthdate", "Birthdate");
        engValues.put("city", "City");
        engValues.put("addStudent", "Add Student");
        engValues.put("details", "Details");
        engValues.put("languages", "Languages");
        engValues.put("code", "Code");
        engValues.put("addCity", "Add City");
        engValues.put("addNewStudent", "Add New Student");
        engValues.put("addNewCity", "Add New City");
        engValues.put("close", "Close");
        engValues.put("yes", "YES");
        engValues.put("no", "NO");
        engValues.put("saveStudent", "Save Student");
        engValues.put("deleteStudent", "Delete Student");
        engValues.put("areYouSure", "Are You Sure");
        engValues.put("confirmDelete", "Confirm Delete");
        engValues.put("saveCity", "Save City");
        engValues.put("deleteCity", "Delete City");
        engValues.put("register", "Register");

        translation.put("eng", engValues);

        HashMap<String, String> kazValues = new HashMap<>();
        kazValues.put("name", "Есімі");
        kazValues.put("surname", "Тегі");
        kazValues.put("allStudents", "Барлық Студенттер");
        kazValues.put("citiess", "Қалалар");
        kazValues.put("birthdate", "Туған Күні");
        kazValues.put("city", "Қалалар");
        kazValues.put("addStudent", "Оқушыны Қосу");
        kazValues.put("details", "Толығырақ");
        kazValues.put("languages", "Тілдер");
        kazValues.put("code", "Код");
        kazValues.put("addCity", "Қаланы Қосу");
        kazValues.put("addNewStudent", "Жаңа оқушыны қосу");
        kazValues.put("addNewCity", "Жаңа қала қосыңыз");
        kazValues.put("close", "Жабу");
        kazValues.put("yes", "Ия");
        kazValues.put("no", "Жоқ");
        kazValues.put("saveStudent", "Оқушыны Сақтау");
        kazValues.put("deleteStudent", "Оқушыны Өшіру");
        kazValues.put("areYouSure", "Сіз Сенімдісіз");
        kazValues.put("confirmDelete", "Жоюды Растаңыз");
        kazValues.put("saveCity", "Қаланы Сақтау");
        kazValues.put("deleteCity", "Қаланы Сақтау");
        kazValues.put("register", "Тіркеу");

        translation.put("kaz", kazValues);
    }

    public static String getTranslationLabelAndLanguages(String label, String lang) {
        return translation.get(lang).get(label);
    }

}
