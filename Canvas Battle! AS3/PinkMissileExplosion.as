package
{
	public class PinkMissileExplosion extends Explosion
	{
		public function PinkMissileExplosion(entity:PinkMissile,c:Boolean = false)
		{
			super(entity,c);
			if(!clone)
			{
				AudioManager.playAudio(AudioManager.getSplatterSoundTwo());
				hitRadius = 41.5;
			}
		}
		public override function getClone():Entity
		{
			return new PinkMissileExplosion(null,true);
		}
	}
}