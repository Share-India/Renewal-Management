import org.apache.poi.ss.usermodel.*;
import java.io.File;
import java.io.FileInputStream;

public class ExcelTester {
    public static void main(String[] args) {
        try {
            FileInputStream fis = new FileInputStream(new File("backend/src/main/resources/Format.xlsx"));
            Workbook workbook = WorkbookFactory.create(fis);
            Sheet sheet = workbook.getSheetAt(0);
            Row headerRow = sheet.getRow(0);
            for (Cell cell : headerRow) {
                System.out.println(cell.getStringCellValue());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
