class DataPoint{
	float x, y;

	DataPoint(float x, float y){
		this.x = x;
		this.y = y;
	}

	void display(){
		rect(x,y,20,20);
	}

}