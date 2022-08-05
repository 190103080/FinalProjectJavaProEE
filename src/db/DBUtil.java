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

    public static ArrayList<Student> getAllItems() {

        ArrayList<Student> students = new ArrayList<>();

        try {

            PreparedStatement statement = connection.prepareStatement("SELECT * FROM students order by id asc");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Student student = new Student();

                student.setId(resultSet.getLong("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setBirthdate(resultSet.getString("birthdate"));
                student.setCity(resultSet.getString("city"));

                students.add(student);
            }

            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;

    }

    public static void addItem(Student student) {
        try {

            PreparedStatement statement = connection.prepareStatement(
                    "INSERT into students (name, surname, birthdate, city)" +
                            "values (?, ?, ?, ?)");

            statement.setString(1, student.getName());
            statement.setString(2, student.getSurname());
            statement.setString(3, student.getBirthdate());
            statement.setString(4, student.getCity());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Student getId(Long id) {

        Student student = null;

        try {

            PreparedStatement statement = connection.prepareStatement("select * from students where id = ?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()) {
                student = new Student();
                student.setId(resultSet.getLong("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setBirthdate(resultSet.getString("birthdate"));
                student.setCity(resultSet.getString("city"));
            }

            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;

    }
}
