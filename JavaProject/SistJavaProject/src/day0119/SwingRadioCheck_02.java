package day0119;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class SwingRadioCheck_02 extends JFrame implements ActionListener {

	Container cp;
	JRadioButton[] rb = new JRadioButton[4]; // 하나만 선택하고 싶을 때
	JCheckBox[] cb = new JCheckBox[4];
	Color[] colors = { Color.red, Color.green, Color.orange, Color.pink };
	JLabel lblMessage;

	public SwingRadioCheck_02(String title) {
		super(title);
		// TODO Auto-generated constructor stub

		cp = this.getContentPane();
		this.setBounds(300, 100, 500, 400);
		cp.setBackground(new Color(255, 204, 204));
		ininDesign();
		this.setVisible(true);
	}

	public void ininDesign() {
		// 상단패널 보더로 감싼 4개의 라디오 버튼
		String[] str1 = { "Red", "Green", "Orange", "Pink" };
		JPanel PTop = new JPanel();
		
		PTop.setBorder(new TitledBorder("글자색"));
		this.add(PTop, BorderLayout.NORTH);

		// 라디오 버튼 하나만 선택되도록 하려면 그룹을 지어줘야함
		ButtonGroup bg = new ButtonGroup();
		for (int i = 0; i < rb.length; i++) {
			rb[i] = new JRadioButton(str1[i], i == 1 ? true : false); // 라디오버튼생성(텍스트,기본체크)
			PTop.add(rb[i]); // 탑패널에 추가
			bg.add(rb[i]); // 버튼그룹에 추가
			rb[i].addActionListener(this);
		}

		// 가운데 라벨
		lblMessage = new JLabel("안녕하세요~~즐거운 금요일", JLabel.CENTER);
		lblMessage.setBorder(new LineBorder(Color.RED, 2)); // 라인 굵기
		this.add("Center", lblMessage);

		// 하단패널에 보더로 감싼 4개의 체크박스
		JPanel pBottom = new JPanel();
		pBottom.setBorder(new TitledBorder("가능언어"));
		this.add("South", pBottom);
		
		

		String[] str2 = { "자바", "오라클", "HTML", "JSP" };

		for (int i = 0; i < cb.length; i++) {
			cb[i] = new JCheckBox(str2[i]);
			pBottom.add(cb[i]);
			cb[i].addActionListener(this);
		}

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob = e.getSource();

		// 라디오버튼 호출처리,메서드 출력이 컬러별로 출력되도록
		for (int i = 0; i < rb.length; i++) {
			if (ob == rb[i]) {
				lblMessage.setForeground(colors[i]);
				lblMessage.setFont(new Font("",Font.BOLD,22));
			}
		}
		
		//체크박스 호출처리(다중선택 : 자바 JSP)
		String msg = "";
		for(int i=0;i<cb.length;i++) {
			if(cb[i].isSelected()==true) {
				msg+=cb[i].getText()+ " ";
			}
		}

		lblMessage.setText(msg);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingRadioCheck_02("스윙 라디오 체크박스_2");
	}

}
