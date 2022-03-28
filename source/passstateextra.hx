package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxTimer;
import flixel.ui.FlxSpriteButton;
import editors.ChartingState;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxInputText;
import Controls;

using StringTools;

class PasswordsState extends MusicBeatState
{
    var passwordstext:FlxText;

	var currletter:Int = 0;

    var locked1:FlxSprite;
    var locked2:FlxSprite;
    var locked3:FlxSprite;
    var locked4:FlxSprite;

    var confirmtext1:FlxText;
    var confirmtext2:FlxText;
    var confirmtext3:FlxText;

    override public function create():Void
    {
        transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;
        
		FlxG.mouse.visible = true;

        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('mickeymenu'));
		bg.screenCenter();
        bg.setGraphicSize(Std.int(bg.width * 0.6));
        add(bg);

        locked1 = new FlxSprite(0, 0).loadGraphic(Paths.image('locked'));
		locked1.updateHitbox();
        add(locked1);

		locked2 = new FlxSprite(0, 100).loadGraphic(Paths.image('locked'));
		locked2.updateHitbox();
        add(locked2);

		locked3 = new FlxSprite(0, 200).loadGraphic(Paths.image('locked'));
		locked3.updateHitbox();
        add(locked3);

        passwordstext = new FlxText(150, 600, 980, "TYPE A PASSWORD", 32);
		passwordstext.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
		passwordstext.scrollFactor.set();
		passwordstext.borderSize = 2.4;
        passwordstext.screenCenter();
		add(passwordstext);

        confirmtext1 = new FlxText(120, 100, 980, "C", 32);
        confirmtext1.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
        confirmtext1.borderSize = 2.4;

        confirmtext2 = new FlxText(145, 100, 980, "U", 32);
        confirmtext2.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
        confirmtext2.borderSize = 2.4;

        confirmtext3 = new FlxText(170, 100, 980, "M", 32);
        confirmtext3.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
        confirmtext3.borderSize = 2.4;
	    }
        override public function update(elapsed:Float)
        {
            if (FlxG.keys.justPressed.BACKSPACE)
                {
                    trace("yas. this worked.");
                    FlxG.sound.play(Paths.sound('cancelMenu'));
                    MusicBeatState.switchState(new MainMenuState());
                }
    
            if(FlxG.keys.justPressed.ESCAPE) {
                    trace("yas. this worked.");
                    FlxG.sound.play(Paths.sound('cancelMenu'));
                    MusicBeatState.switchState(new MainMenuState());
                }
    
            if (FlxG.mouse.overlaps(locked1) && FlxG.mouse.justPressed)
                {   
                    trace("yas. this worked.");
    
                    PlayState.SONG = Song.loadFromJson('uxoricide', 'uxoricide');
                    PlayState.isStoryMode = true;
                    PlayState.storyDifficulty = 2;
                    new FlxTimer().start(0.07, function(tmr:FlxTimer)
                    {
                        LoadingState.loadAndSwitchState(new PlayState()); 
                    });
                }

        if (FlxG.keys.justPressed.C)
            add(confirmtext1);
            if (currletter == 0)
                currletter = 1;
            else
                currletter == 0;
        {
            if (FlxG.keys.justPressed.U)
                add(confirmtext2);
                if (currletter == 1)
                    currletter = 2;
                else
                    currletter == 0;
            {
                if (FlxG.keys.justPressed.M)
                    add(confirmtext3);
                    if (currletter == 2)
                        currletter = 3;
                    else
                        currletter == 0;
                {
                    if (currletter == 3 && FlxG.keys.justPressed.ENTER)
                    {
                        FlxG.camera.flash(FlxColor.WHITE, 1);
						trace("yas. this worked.");
                        remove(locked1);
                        remove(confirmtext1);
                        remove(confirmtext2);
                        remove(confirmtext3);
                        currletter = 0;
                    }
                }
            }
        }
    }
}