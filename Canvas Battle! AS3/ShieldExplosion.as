package 
{
	public class ShieldExplosion extends Explosion
	{
		public function ShieldExplosion(entity:PlayerShield,c:Boolean = false) 
		{
			super(entity,c);
			fillWithColor(entity.getPlayer().getColor());
			AudioManager.playAudio(AudioManager.getShieldBreakSound());
		}
		public override function getClone():Entity
		{
			return new ShieldExplosion(null,true);
		}
	}
}
