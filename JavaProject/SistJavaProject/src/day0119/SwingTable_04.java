package day0119;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class SwingTable_04 extends JFrame {

	Container cp;
	JTable table;
	JLabel lblTitle, lblOut;

	public SwingTable_04(String title) {
		super(title);
		// TODO Auto-generated constructor stub

		cp = this.getContentPane();
		this.setBounds(300, 100, 500, 400);
		cp.setBackground(new Color(255, 204, 204));
		ininDesign();
		this.setVisible(true);
	}

	public void ininDesign() {
		String[][] data = { { "송햬교", "서울", "010-111-4444" }, { "전지현", "인천", "010-111-2222" },
				{ "이효리", "부산", "010-7777-9999" } };

		String[] title = { "이름", "주소", "연락처" };

		lblTitle = new JLabel("JTable연습", JLabel.CENTER);
		lblOut = new JLabel("결과출력하는곳", JLabel.CENTER);

		table = new JTable(data, title);


		JScrollPane pane = new JScrollPane(table);

		// 테이블에 마우스 이벤트 추가

		table.addMouseListener(new TableEvent());
		this.add("North", lblTitle);
		this.add("Center", pane);
		this.add("South", lblOut);

	}

	class TableEvent extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent e) {
			// TODO Auto-generated method stub
			super.mouseClicked(e);

//			System.out.println("테이블 출력!!");
			// 선택한 행번호 얻기
			int rowNum = table.getSelectedRow();

//			JOptionPane.showMessageDialog(SwingTable_04.this, "행번호:" + rowNum);
			String str = "이름 : " + table.getValueAt(rowNum, 0)
			 + ", 주소 : " + table.getValueAt(rowNum, 1)
			 + ", 핸드폰 : " + table.getValueAt(rowNum, 2);
			
			lblOut.setText(str);
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingTable_04("스윙테이블");
	}

}
