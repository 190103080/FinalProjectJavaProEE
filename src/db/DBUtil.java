package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBUtil {

    private static Connection connection;

    static {

        try {

            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/student",
                    "postgres",
                    "batr.2002");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static ArrayList<Student> getAllStudents() {

        ArrayList<Student> students = new ArrayList<>();

        try {

            PreparedStatement statement = connection.prepareStatement(
                    "select s.id, s.name,  s.surname, s.birthdate, s.city_id, c.name as cityName, code\n" +
                        "FROM students s\n" +
                        "inner join cities c on s.city_id = c.id\n" +
                        "order by s.id desc"
            );
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Student student = new Student();

                student.setId(resultSet.getLong("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setBirthdate(resultSet.getString("birthdate"));

                City city = new City();
                city.setId(resultSet.getLong("city_id"));
                city.setName(resultSet.getString("cityName"));
                city.setCode(resultSet.getString("code"));

                student.setCity(city);
                students.add(student);
            }

            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;

    }

    public static ArrayList<City> getAllCities() {

        ArrayList<City> cities = new ArrayList<>();

        try {

            PreparedStatement statement = connection.prepareStatement("SELECT * FROM cities order by name asc");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                cities.add(new City(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("code")
                ));
            }

            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cities;

    }

    public static void addStudent(Student student) {
        try {

            PreparedStatement statement = connection.prepareStatement(
                    "INSERT into students (name, surname, birthdate, city_id)" +
                            "values (?, ?, ?, ?)");

            statement.setString(1, student.getName());
            statement.setString(2, student.getSurname());
            statement.setString(3, student.getBirthdate());
            statement.setLong(4, student.getCity().getId());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addCities(City cities) {
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "insert into cities (name, code)" +
                    "values (?, ?)");

            statement.setString(1, cities.getName());
            statement.setString(2, cities.getCode());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Student getStudent(Long id) {

        Student student = null;

        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "select s.id, s.name,  s.surname, s.birthdate, s.city_id, c.name as cityName, code\n" +
                    "FROM students s\n" +
                    "inner join cities c on s.city_id = c.id\n" +
                    "where s.id = ?");

            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()) {
                student = new Student();
                student.setId(resultSet.getLong("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setBirthdate(resultSet.getString("birthdate"));

                City city = new City();
                city.setId(resultSet.getLong("city_id"));
                city.setName(resultSet.getString("cityName"));
                city.setCode(resultSet.getString("code"));

                student.setCity(city);
            }

            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;

    }

    public static City getCity(Long id) {

        City city = null;

        try {

            PreparedStatement statement = connection.prepareStatement("select * from cities where id = ?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()) {
                city = new City();
                city.setId(resultSet.getLong("id"));
                city.setName(resultSet.getString("name"));
                city.setCode(resultSet.getString("code"));
            }

            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return city;

    }

    public static void updateStudent(Student student) {
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "update students set name = ?, surname = ?, birthdate = ?, city_id = ? " +
                    "where id = ?");

            statement.setString(1, student.getName());
            statement.setString(2, student.getSurname());
            statement.setString(3, student.getBirthdate());
            statement.setLong(4, student.getCity().getId());
            statement.setLong(5, student.getId());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void updateCity(City city) {
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "update cities set name = ?, code = ? where id = ?");

            statement.setString(1, city.getName());
            statement.setString(2, city.getCode());
            statement.setLong(3, city.getId());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void deleteStudent(Long id) {

        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "delete from students where id = ?");

            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void deleteCity(Long id) {

        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "delete from cities where id = ?");

            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
