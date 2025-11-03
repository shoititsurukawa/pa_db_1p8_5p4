function plot_amam(signal_in, signal_out)
    % plot_amam - Plot AM-AM characteristic of a PA
    %
    % Inputs:
    %   signal_in  - complex input signal to the PA
    %   signal_out - complex output signal from the PA

    abs_in  = abs(signal_in);
    abs_out = abs(signal_out);

    figure('Name','AM-AM','Color','w');
    plot(abs_in, abs_out, '.', 'MarkerSize', 5);
    xlabel('|Input|');
    ylabel('|Output|');
    title('AM-AM Characteristic');
    grid on;
end
