function draw(sys,x,dt,filename)

if nargin < 3
    dt = 0;
end
if nargin >= 4
    video = true;
else
    video = false;
end

% parameters
l1  = sys.length_1;   % length of the first bar
l2  = sys.length_2;   % length of the second bar
lc1 = l1/2;  % center of mass of the first bar
lc2 = l2/2;  % center of mass of the second bar

% dimensions
L = l1+l2;

if video
    v = VideoWriter(['videos/' filename '.avi'],'Motion JPEG AVI');
    open(v);
end

figure('units','normalized','outerposition',[0 0 1 1]);

for k = 1:size(x,1)
    
    % state
    q1 = x(k,1);
    q2 = x(k,2);
    
    % center of mass
    pc1 = [ lc1*sin(q1); -lc1*cos(q1) ];
    pc2 = [ l1*sin(q1)+lc2*sin(q1+q2); -l1*cos(q1)-lc2*cos(q1+q2) ];

    % end of bars
    p1 = [ l1*sin(q1); -l1*cos(q1) ];
    p2 = [ l1*sin(q1)+l2*sin(q1+q2); -l1*cos(q1)-l2*cos(q1+q2) ];

    % draw the plot
    plot([0 -p1(1) -p2(1)],[0 -p1(2) -p2(2)],'LineWidth',10); hold on;
    plot([0 -pc1(1) -pc2(1)],[0 -pc1(2) -pc2(2)],'.g','MarkerSize',30);

    xlim(1.2*[-L L]);
    ylim(1.2*[-L L]);
    set(gca,'Color','k','XColor','w','YColor','w')
    set(gcf,'Color','k')
    set(gcf,'InvertHardcopy','off')
    axis square
    drawnow
    hold off

    if video
        frame = getframe(gcf);
        writeVideo(v,frame);
    end

    pause(dt);

end

if video
    close(v);
end

end