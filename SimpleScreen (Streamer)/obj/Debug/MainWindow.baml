   M S B A M L   `   `   `  ����R  NSimpleScreen (Streamer), Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:SimpleScreen__Streamer_SimpleScreen__Streamer_  5   	   (    "SimpleScreen__Streamer_.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   7local%clr-namespace:SimpleScreen__Streamer_     5   	     � Title$  SimpleScreen (Streamer)��5   	   $	��500��6)   $	��400��66   $��18(�6B   
������� � 
ResizeMode$ CanMinimize=�6c    � Icon$ Images/Artboard 1.png��6|    � WindowStartupLocation$ CenterScreen=�6�    � WindowStyle$
 None=�6�    � 	Resources 5	         BlueToGreenGradient �� EndPoint � MappingMode �� 
StartPoint	 � Color
 � Offset  ButtonBrush  ButtonHoverBrush  TextBoxStyle �� 
TargetType �� Property �� Value �� Triggers P� Property P� Value  ButtonStyle  ButtonStyleNoHighlighting �� 
TargetType'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup   States   System.Windows.VisualState��%U  &	        &	 �     &	 �     &	 �     &	 �    &	 `    �� 5
   
   $ 0.5,1&�6:   $ RelativeToBoundingBox=�6K   $ 0.5,0&�6o   .��5      � $	 	#FF005DFF��6   � 5      $	 	#FF00FF97��6   $
 1Q�6-   5      ��5   
   #36393F��5      ��5   
   #2F3136��5      �� 5   
   " ��6%   .�5      ��  � ��$ 0q�60   6<    5      P� 5       �@J�IsMouseOver . . �5      ��  � ��$ 0q�68   5      5      �� 5   
   " ��6$   .�5      ��  � �� �	#FF2F31366?    5      P� 5        �@J�IsMouseOver . . �5!      ��  � ��# �  63   6`   5"      5$      �� 5&   
   " ��62   .�5'      ��  � �� 5(      �� 5)      " ��6&   .R�5*      � #��z��6    5+        5,   "   CommonStates��. 5-   &     
Normal��62   5/   #   51      52      54      �� 55       � ��
 �   �6<    56      P� 57       �@J�IsMouseOver . . �58      ��  �@�Cursor$
 Hand��6/   6>   �� 59       �@J�Opacity$	 0.2Q�60   6>   5:      5<      5=      .��5?      �  � ColumnDefinitions 5@   
   �� 5A      .+�5D   
   �� -   5         ��Name$ LeftRect��5D      ���	#FF1E2124
���   �67   �� 5E   
   -   5         ��Name$ IPLabel��5E      $��IP��6!   $
��Left=�6.   $��10,32.333,0,0q�6I   $	��Top=�6`   $��16(�6�   $��Center=�6�   $��29��6�   $��31.28��6�   
�������6  �� 5F   
   -   5        $ StatusLabel��5F      $��Offline��6%   $��	10,0,0,10q�67   $��Bottom=�6J   $��18(�6e   $��Product Sans)�6s   $��30��6�   $
��Left=�6�   $��65��6�   ���	#FFF03E3A6  �� 5G   
   -   5         ��Name$ IPTextBorder��5G      
���   �$��1q�6;   $��10,68.613,10,0q�6O   $��50��6g    �� CornerRadius$ 5��6s   ���	#FF2F3136$	��Top=�6�   ._�5H      �� -   5         ��Name$ IPText��5H      #���  6&   $��-1q�6M    �� TextWrapping$
 Wrap=�6Y   $��22(�6m   $��Center=�6{   $��Product Sans)�6�   $��Center=�6�   
���������6�   Z� ��6�   Z�  �� TextDecorations 6  Z� 5I      �� 5J   
   
���   �$��1q�6%   $��50,272,50,74q�69   ._�5K      �� -   5         ��Name$ 
PlayButton��5K      #��[ 6)    � Cursor$
 Hand��6�   
���   �$��Product Sans)�6�   $��Center=�6�   $��Center=�6  $	��300��6>  
�������$��36(�6]  $��Start��6l  ���	#FF2F31366|  5L      �� 5M   
   -   5        $ PlayButtonLabel��5M      |�.  $��Start��6;   $��Product Sans)�6K   $��36(�6e   $��Center=�6s   $��Center=�6�   
�������$��157,0,157,124q�6�   $��54��6�   $��Bottom=�6  ��6�   Z� 6  �� 5R   
   -   5        $ 
ExitButton��5R      #���  6%   $��Right=�6Y   $��20��6u   $��	0,10,10,0q�6�   $	��Top=�6�   $��20��6�   ��6�   Z� ��6�   Z� ��5S      �� 5T       �� ImageSource$ Images/ExitImage.png��6   .��5V      �� $ Images/ExitImage.png��6   5W      �� 5Y   
   -	   5        $ MinimizeButton��5Y      |�.  #���  6;   $��Right=�6o   $��20��6�   $��	0,10,35,0q�6�   $	��Top=�6�   $��20��6�   $��Center=�6�   $��Center=�6  ��6�   Z� ��6�   Z� ��5[      �� 5\      $ Images/MinimizeImage.png��6    j� Stretch$ Uniform=�6D   5^      �� 5_   
   -
   5        $ DraggableRectangle��5_      $��37��60   $	��Top=�6<   $��0,0,60,0q�6}   ���	#001E21246�   5a      5b      