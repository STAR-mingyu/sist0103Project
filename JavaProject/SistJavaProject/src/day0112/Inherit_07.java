package day0112;

class School {

	public static final String SCHOOLNAME = "쌍용고등학교";
	private String schoolAddr;
	private int countStu;
	private int countTeacher;

	public School() {
		this("강남구 역삼동", 120, 10);
	}

	public School(String saddr, int cntsut, int cntteacher) {
		this.schoolAddr = saddr;
		this.countStu = cntsut;
		this.countTeacher = cntteacher;
	}
	
	// setter&getter

	public String getSchoolAddr() {
		return schoolAddr;
	}

	public void setSchoolAddr(String schoolAddr) {
		this.schoolAddr = schoolAddr;
	}

	public int getCountStu() {
		return countStu;
	}

	public void setCountStu(int countStu) {
		this.countStu = countStu;
	}

	public int getCountTeacher() {
		return countTeacher;
	}

	public void setCountTeacher(int countTeacher) {
		this.countTeacher = countTeacher;
	}

	public static String getSchoolname() {
		return SCHOOLNAME;
	}

	// 메서드

	public void writerData() {
		
		System.out.println("학교주소 : " + this.schoolAddr);
		System.out.println("학생수 : " + this.countStu + ", 선생님수" + this.countTeacher);

	}

}
///////////////////

class Student extends School {

	private String stuName;
	private int grade;

	public Student() {
		this("강남구 역삼동", 120, 10,"김민규",4);
	}

	public Student(String sAddr, int cntStu, int cntTea, String stuname, int gra) {
		super(sAddr, cntStu, cntTea);
		this.stuName = stuname;
		this.grade = gra;

	}

	// 각각의 setter & getter

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public void writerData() {
		// TODO Auto-generated method stub
		System.out.println("학교명 : " + SCHOOLNAME);
		super.writerData();
		System.out.println("학생명 : " + stuName);
		System.out.println("학년 : " + grade + "학년");
	}

}

public class Inherit_07 {

	public static void main(String[] args) {
		Student s1 = new Student();
		s1.writerData();
		System.out.println();

		Student s2 = new Student("영등포구", 300, 35, "김숙", 2);
		s2.writerData();

		System.out.println();
		System.out.println("2번째 학생 학생명과 학년 변경후 출력");
		s1.setStuName("이영자");
		s1.setGrade(1);
		s1.writerData();

	}

}
