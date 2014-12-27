package 
{	
	public class EnemySlowBanner extends PowerUpBanner
	{
		public function EnemySlowBanner(e:Entity,c:Boolean = false) 
		{
			super(e,c);
		}
		public override function getClone():Entity
		{
			return new EnemySlowBanner(null,true);
		}
	}
}