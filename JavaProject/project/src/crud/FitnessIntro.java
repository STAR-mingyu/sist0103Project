package crud;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;

public class FitnessIntro extends JFrame implements ActionListener {

	Container container;
	JButton introBtn;

	private Image introBg = new ImageIcon(FitnessIntro.class.getResource("../img/fitness_intro.jpg")).getImage();// 배경이미지

	public FitnessIntro(String title) {
		super(title);
		container = this.getContentPane();
		setSize(900, 600);
		setResizable(false);
		setLocationRelativeTo(null);
//		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		design();
		this.setVisible(true);

	}

	// 디자인
	public void design() {

		this.setLayout(null);
		introBtn = new JButton("회원 관리 접속");
		introBtn.setBounds(350, 240, 200, 60);
		introBtn.setBackground(Color.white);
		introBtn.setFont(new Font("맑은 고딕", Font.BOLD, 14));
		introBtn.addActionListener(this);
		introBtn.setForeground(Color.black); // 버튼 텍스트의 색상
		introBtn.setFocusPainted(false);
//		introBtn.setBorderPainted(false); //버튼 라인 없애기

		this.add(introBtn);

	}

	// 액션
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub

		Object ob = e.getSource();

		if (ob == introBtn) {
			this.setVisible(false);
			FitnessMain main = new FitnessMain("화이트 피트니스 센터");

		}
	}

	// 배경이미지
	public void paint(Graphics g) {
		g.drawImage(introBg, 0, 0, getWidth(), getHeight(), this);
	}

	public static void main(String[] args) {
		new FitnessIntro("화이트 피트니스 센터");

	}

}
