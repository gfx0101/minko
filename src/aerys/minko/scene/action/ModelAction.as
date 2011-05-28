package aerys.minko.scene.action
{
	import aerys.minko.render.renderer.IRenderer;
	import aerys.minko.scene.node.IScene;
	import aerys.minko.scene.node.Model;
	import aerys.minko.scene.visitor.ISceneVisitor;
	
	public class ModelAction implements IAction
	{
		private static var _instance	: ModelAction	= null;
		
		public static function get modelAction() : ModelAction
		{
			return _instance || (_instance = new ModelAction());
		}
		
		public function get name() : String
		{
			return "RenderAction";
		}
		
		public function prefix(scene : IScene, visitor : ISceneVisitor, renderer : IRenderer) : Boolean
		{
			var model : Model = scene as Model;
			
			if (!model)
				throw new Error();
			
			if (!model.visible)
				return false;
			
			return true;
		}
		
		public function infix(scene : IScene, visitor : ISceneVisitor, renderer : IRenderer) : Boolean
		{
			var model : Model = scene as Model;
			
			if (!model.visible)
				return false;
			
			model.texture && visitor.visit(model.texture);
			model.mesh && visitor.visit(model.mesh);
			
			return true;
		}
		
		public function postfix(scene : IScene, visitor : ISceneVisitor, renderer : IRenderer) : Boolean
		{
			var model : Model = scene as Model;
			
			if (!model.visible)
				return false;
			
			return true;
		}
	}
}