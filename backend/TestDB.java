import java.sql.*;

public class TestDB {
    public static void main(String[] args) throws Exception {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/insurance_renewal", "root", "root@123");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT target_team, last_routed_from, routed_at FROM policy WHERE target_team='RENEWER'");
        while(rs.next()) {
            System.out.println("target_team: " + rs.getString(1) + ", last_routed_from: " + rs.getString(2) + ", routed_at: " + rs.getString(3));
        }
        conn.close();
    }
}
