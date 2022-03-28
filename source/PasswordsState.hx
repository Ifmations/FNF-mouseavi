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
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUICheckBox;
import Controls;
import Conductor.BPMChangeEvent;
import Section.SwagSection;
import Song.SwagSong;

using StringTools;

class PasswordsState extends MusicBeatState
{
    private var blockPressWhileTypingOn:Array<FlxUIInputText> = [];
	private var blockPressWhileScrolling:Array<FlxUIDropDownMenuCustom> = [];
    var man:String = "";
	var thing:FlxUIInputText;

    var locked1:FlxSprite;
    var locked2:FlxSprite;
    var locked3:FlxSprite;
    var locked4:FlxSprite;
    var locked5:FlxSprite;

    var confirmtext1:FlxText;
    var confirmtext2:FlxText;
    var confirmtext3:FlxText;

    var passwordstext:FlxText;

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

		locked2 = new FlxSprite(250, 0).loadGraphic(Paths.image('locked'));
		locked2.updateHitbox();
        add(locked2);

		locked3 = new FlxSprite(500, 0).loadGraphic(Paths.image('locked'));
		locked3.updateHitbox();
        add(locked3);

        locked4 = new FlxSprite(750, 0).loadGraphic(Paths.image('locked'));
		locked4.updateHitbox();
        add(locked4);

        locked5 = new FlxSprite(1000, 0).loadGraphic(Paths.image('locked'));
		locked5.updateHitbox();
        add(locked5);

        thing = new FlxUIInputText(0, 310, 1350, man, 64);
		blockPressWhileTypingOn.push(thing);
		add(thing);

        passwordstext = new FlxText(150, 250, 980, "TYPE A PASSWORD", 32);
		passwordstext.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
		passwordstext.scrollFactor.set();
		passwordstext.borderSize = 2.4;
		add(passwordstext);

        super.create();
    }
        override public function update(elapsed:Float)
        {
            if (FlxG.keys.justPressed.BACKSPACE)
                {
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

            if (thing.text == "ok")
                {
                    PlayState.SONG = Song.loadFromJson('uxoricide', 'uxoricide');
                    PlayState.isStoryMode = true;
                    PlayState.storyDifficulty = 2;
                    new FlxTimer().start(0.07, function(tmr:FlxTimer)
                    {
                        LoadingState.loadAndSwitchState(new PlayState()); 
                    });
                }
                super.update(elapsed);
    }
}