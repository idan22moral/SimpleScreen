   M S B A M L   `   `   `  ���� R  NSimpleScreen (Streamer), Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:SimpleScreen__Streamer_SimpleScreen__Streamer_  (    "SimpleScreen__Streamer_.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     7local%clr-namespace:SimpleScreen__Streamer_       � Title$  SimpleScreen (Streamer)��$	��500��$	��400��$��18(�
������� � 
ResizeMode$ CanMinimize=� � Icon$ Images/Artboard 1.png�� � WindowStartupLocation$ CenterScreen=� � WindowStyle$
 None=� � 	Resources    BlueToGreenGradient �� EndPoint � MappingMode �� 
StartPoint	 � Color
 � Offset  ButtonBrush  ButtonHoverBrush  TextBoxStyle �� 
TargetType �� Property �� Value �� Triggers P� Property P� Value  ButtonStyle  ButtonStyleNoHighlighting �� 
TargetType'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup   States   System.Windows.VisualState��%q  &	        &	 n     &	      &	 �     &	 �     &	 T    �� $ 0.5,1&�$ RelativeToBoundingBox=�$ 0.5,0&�.��� $	 	#FF005DFF��� $	 	#FF00FF97��$
 1Q���#36393F����#2F3136���� " ��.���  � ��$ 0q� P�  �@J�IsMouseOver . . ���  � ��$ 0q��� " ��.���  � �� �	#FF2F3136 P�  �@J�IsMouseOver . . ���  � ��# �  �� " ��.���  � �� �� " ��.R�� #��z��   CommonStates��.   
Normal����  � ��
 �   � P�  �@J�IsMouseOver . . ���  �@�Cursor$
 Hand����  �@J�Opacity$	 0.2Q�.���  � ColumnDefinitions �� .+��� -    ��Name$ LeftRect�����	#FF1E2124
���   ��� -    ��Name$ IPLabel��$��IP��$
��Left=�$��10,32.333,0,0q�$	��Top=�$��16(�$��Center=�$��29��$��31.28��
��������� -   $ StatusLabel��$��Offline��$��	10,0,0,10q�$��Bottom=�$��18(�$��Product Sans)�$��30��$
��Left=�$��65�����	#FFF03E3A�� -    ��Name$ IPTextBorder��
���   �$��1q�$��10,68.613,10,0q�$��50�� �� CornerRadius$ 5�����	#FF2F3136$	��Top=�._��� -    ��Name$ IPText��#���  $��-1q� �� TextWrapping$
 Wrap=�$��22(�$��Center=�$��Product Sans)�$��Center=�
���������Z� ��Z�  �� TextDecorations Z� �� 
���   �$��1q�$��50,272,50,74q�._��� -    ��Name$ 
PlayButton��#��[  � Cursor$
 Hand��
���   �$��Product Sans)�$��Center=�$��Center=�$	��300��
�������$��36(�$��Start�����	#FF2F3136�� -   $ PlayButtonLabel��|�.  $��Start��$��Product Sans)�$��36(�$��Center=�$��Center=�
�������$��157,0,157,124q�$��54��$��Bottom=���Z� �� -   $ 
ExitButton��#���  $��Right=�$��20��$��	0,10,10,0q�$	��Top=�$��20����Z� ��Z� ����  �� ImageSource$ Images/ExitImage.png��.���� $ Images/ExitImage.png���� -	   $ MinimizeButton��|�.  #���  $��Right=�$��20��$��	0,10,35,0q�$	��Top=�$��20��$��Center=�$��Center=���Z� ��Z� ���� $ Images/MinimizeImage.png�� j� Stretch$ Uniform=��� -
   $ DraggableRectangle��$��37��$	��Top=�$��0,0,60,0q����	#001E2124